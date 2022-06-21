local path = require 'utils.api.path'

---@class PluginModule
---@field bootstrapped boolean is bootstrapped
---@field loaded boolean is packer.nvim loaded
---@field plugins PluginSpec[] used plugins

---@alias PluginSpec string|table

---@type PluginModule
local plugin = {
  bootstrapped = false,
  loaded = false,
  plugins = {},
}

local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'
local repository = 'https://github.com/wbthomason/packer.nvim'

function plugin.is_ready()
  ---@diagnostic disable-next-line: missing-parameter
  return vim.fn.empty(vim.fn.glob(install_path)) == 0
end

---@param hook function()
function plugin.init(hook)
  if not plugin.is_ready() then
    vim.fn.system { 'git', 'clone', '--depth', '1', repository, install_path }
  end
  plugin.load()
  plugin.sync(hook)
end

function plugin.load()
  if plugin.loaded then
    return
  end
  vim.cmd [[packadd packer.nvim]]
  require('packer').init {
    -- https://github.com/wbthomason/packer.nvim/issues/202#issuecomment-826481883
    max_jobs = 50,
    display = {
      open_fn = require('packer.util').float,
    },
  }
  plugin.loaded = true
end

function plugin.reset()
  if plugin.loaded then
    require('packer').reset()
  end
  plugin.plugins = {}
end

---@return string
local function canonical_name(spec)
  if spec.as then
    return spec.as
  end
  local name = type(spec) == 'string' and spec or spec[1]
  return string.match(name, '/([%w%-_]+).?')
end

---only returns config path if config/lua/<path> exists
---@param name string
local function get_config_path(name)
  local config_path = path.join('config', 'plugins', name:lower())
  return config_path
  -- local config_file_path = path.join(vim.fn.stdpath 'config', 'lua', string.format('%s.lua', config_path))
  -- if vim.fn.filereadable(config_file_path) == 1 then
  --   return config_path
  -- end
  -- return nil
end

---@return table|string
local function add_config(spec)
  if type(spec) == 'string' then
    return spec
  end
  if type(spec) == 'table' and #spec > 1 then
    for i, child in ipairs(spec) do
      spec[i] = add_config(child)
    end
    return spec
  end

  local name = canonical_name(spec)
  local config_path = get_config_path(name)
  -- if config_path then
  if spec.ptp == 'viml' then
    spec.setup = string.format('require("%s").entrance()', config_path)
  else
    if spec.setup == true then
      spec.setup = string.format("require('%s').setup()", config_path)
    end
    if spec.config == true then
      spec.config = string.format("require('%s').config()", config_path)
    end
  end
  -- end
  return spec
end

local function strip_unused_config(spec)
  if spec.setup == false then
    spec.setup = nil
  end
  if spec.config == false then
    spec.setup = nil
  end
  return spec
end

function plugin.use(spec)
  if type(spec) == 'table' then
    spec = add_config(spec)
    spec = strip_unused_config(spec)
  end
  plugin.plugins[#plugin.plugins + 1] = spec
end

local function use_plugins()
  plugin.load()
  for _, p in ipairs(plugin.plugins) do
    require('packer').use(p)
  end
end

function plugin.source_compiled()
  local file = require('packer').config.compile_path
  local ok, err = pcall(vim.cmd, 'source ' .. file)
  if not ok then
    vim.notify("source packer's compiled file fail: " .. tostring(err), 'warn')
  end
end

---set compiled hook function
---@param hook function
function plugin.set_compiled_hook(hook)
  vim.api.nvim_create_autocmd('User PackerCompileDone', { callback = hook, once = true })
end

function plugin.sync(hook)
  use_plugins()
  hook = hook or plugin.source_compiled
  plugin.set_compiled_hook(hook)
  require('packer').sync()
end

function plugin.compile(hook)
  use_plugins()
  hook = hook or plugin.source_compiled
  plugin.set_compiled_hook(hook)
  require('packer').compile()
end

function plugin.sync_and_quit()
  use_plugins()
  local qall = function()
    vim.cmd [[qall]]
  end
  plugin.set_compiled_hook(qall)
  require('packer').compile()
end

return plugin
