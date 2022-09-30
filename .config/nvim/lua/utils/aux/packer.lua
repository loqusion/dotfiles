local api = require 'utils.api'

local packer_wrapper = {}

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'
local repository = 'https://github.com/wbthomason/packer.nvim'

local function is_packer_installed()
  ---@diagnostic disable-next-line: missing-parameter
  return vim.fn.empty(vim.fn.glob(install_path)) == 0
end

local function ensure_packer_installed()
  if not is_packer_installed() then
    vim.fn.system { 'git', 'clone', '--depth', '1', repository, install_path }
    return true
  end
  return false
end

local function get_canonical_name(plugin_spec)
  if plugin_spec.as then
    return plugin_spec.as
  end
  local name = type(plugin_spec) == 'string' and plugin_spec or plugin_spec[1]
  local last_slash_index = string.find(name, '/')
  return string.match(name, '.*/([%w%-_]+).?', last_slash_index)
end

local function get_config_path(canonical_name)
  local config_path = api.path.join('config', 'plugins', canonical_name:lower())
  local config_file_path = api.path.join(vim.fn.stdpath 'config', 'lua', string.format('%s.lua', config_path))

  if vim.fn.filereadable(config_file_path) == 1 then
    return config_path
  end
  return nil
end

local function is_multi_spec(plugin_spec)
  return type(plugin_spec) == 'table' and #plugin_spec > 1
end

local function add_config(plugin_spec)
  if type(plugin_spec) == 'string' then
    return plugin_spec
  end
  if is_multi_spec(plugin_spec) then
    for i, child in ipairs(plugin_spec) do
      plugin_spec[i] = add_config(child)
    end
    return plugin_spec
  end

  local canonical_name = get_canonical_name(plugin_spec)
  local config_path = get_config_path(canonical_name)
  if config_path then
    if plugin_spec.ptp == 'viml' then
      plugin_spec.setup = string.format("require('%s').entrance()", config_path)
    else
      if plugin_spec.setup == true then
        plugin_spec.setup = string.format("require('%s').setup()", config_path)
      end
      if plugin_spec.config == true then
        plugin_spec.config = string.format(
          [[
            if require('utils.api').safe_load(require('%s')) then
              require('%s').config()
            end
          ]],
          config_path,
          config_path
        )
      end
    end
  end

  return plugin_spec
end

local function strip_unused_config(plugin_spec)
  if type(plugin_spec) == 'string' then
    return plugin_spec
  end
  if is_multi_spec(plugin_spec) then
    for i, child in ipairs(plugin_spec) do
      plugin_spec[i] = strip_unused_config(child)
    end
    return plugin_spec
  end

  if plugin_spec.config == true or plugin_spec.setup == true then
    api.notify(
      string.format(
        'Config file expected by spec but does not exist:\n%s\ncanonical name: %s',
        vim.inspect(plugin_spec),
        get_canonical_name(plugin_spec)
      ),
      'error'
    )
  end

  if type(plugin_spec.setup) == 'boolean' then
    plugin_spec.setup = nil
  end
  if type(plugin_spec.config) == 'boolean' then
    plugin_spec.config = nil
  end
  return plugin_spec
end

local function augment(plugin_spec)
  plugin_spec = add_config(plugin_spec)
  plugin_spec = strip_unused_config(plugin_spec)
  return plugin_spec
end

function packer_wrapper.entry(plugins)
  local packer = require 'packer'

  local should_sync = ensure_packer_installed()
  vim.cmd [[packadd packer.nvim]]

  packer.startup {
    function(use)
      for kind, kind_plugins in pairs(plugins) do
        for _, plugin_spec in ipairs(kind_plugins) do
          if type(plugin_spec) == 'table' then
            plugin_spec = augment(plugin_spec)
          end
          use(plugin_spec)
        end
      end
    end,
    config = {
      -- https://github.com/wbthomason/packer.nvim/issues/202#issuecomment-826481883
      max_jobs = 50,
      display = {
        open_fn = require('packer.util').float,
      },
    },
  }

  if should_sync then
    packer.sync()
  end
end

return packer_wrapper
