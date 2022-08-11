local api = require 'utils.api'

---@class PluginModule
---@field bootstrapped boolean is bootstrapped
---@field loaded boolean is packer.nvim loaded
---@field plugins PluginSpec[] used plugins

---@class PluginSpecTable
---@field [number]    string      The plugin location string
---@field disable?    boolean     Mark a plugin as inactive
---@field as?         string      Specifies an alias under which to install the plugin
---@field installer?  function    Specifies custom installer. See `|packer-custom-installers|`
---@field updater?    function    Specifies custom updater. See `|packer-custom-installers|`
---@field after?      string|list Specifies plugins to load before this plugin
---@field rtp?        string      Specifies a subdirectory of the plugin to add to `'runtimepath'`
---@field opt?        boolean     Manually marks a plugin as optional
---@field branch?     string      Specifies a git branch to use
---@field tag?        string      Specifies a git tag to use. Supports '*' for "latest tag"
---@field commit?     string      Specifies a git commit to use
---@field lock?       boolean     Skip updating this plugin in updates/syncs. Still cleans.
---@field run?        string|function|table   Post-update/install hook. See `|packer-plugin-hooks|`
---@field requires?   string|list Specifies plugin dependencies. See `|packer-plugin-dependencies|`
---@field config?     string|function|boolean Specifies code to run after this plugin is loaded.
---@field rocks?      string|list Specifies Luarocks dependencies for the plugin
---@field cmd?        string|list Specifies commands which load this plugin. Can be an autocmd pattern.
---@field ft?         string|list Specifies filetypes which load this plugin.
---@field keys?       string|list Specifies maps which load this plugin. See `|packer-plugin-keybindings|`
---@field event?      string|list Specifies autocommand events which load this plugin.
---@field fn?         string|list Specifies functions which load this plugin.
---@field cond?       string|function|list    Specifies a conditional test to load this plugin
---@field setup?      string|function|boolean Specifies code to run before this plugin is loaded.
---@field module?     string|list Specifies Lua module names for require. When requiring a string which starts with one of these module names, the plugin will be loaded.
---@field module_pattern?  string|list Specifies Lua pattern of Lua module names for require. When requiring a string which matches one of these patterns, the plugin will be loaded.
---@field ptp?        string      Specifies plugin type, e.g. 'viml'
---@field wants?      string|list `packer_load` is called on each plugin before this plugin is `packadd`ed

---@alias SinglePluginSpec string|PluginSpecTable
---@alias MultiPluginSpec table<SinglePluginSpec>
---@alias PluginSpec SinglePluginSpec|MultiPluginSpec

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
  local last_slash_index = string.find(name, '/')
  return string.match(name, '.*/([%w%-_]+).?', last_slash_index)
end

---only returns config path if config/lua/<path> exists
---@param name string
local function get_config_path(name)
  local config_path = api.path.join('config', 'plugins', name:lower())
  local config_file_path = api.path.join(vim.fn.stdpath 'config', 'lua', string.format('%s.lua', config_path))

  if vim.fn.filereadable(config_file_path) == 1 then
    return config_path
  end
  return nil
end

local function is_multi_spec(spec)
  return type(spec) == 'table' and #spec > 1
end

---@param spec PluginSpec
---@return table|string
local function add_config(spec)
  if type(spec) == 'string' then
    return spec
  end ---@cast spec -string
  if is_multi_spec(spec) then
    for i, child in ipairs(spec) do
      spec[i] = add_config(child)
    end
    return spec
  end ---@cast spec -MultiPluginSpec

  local name = canonical_name(spec)
  local config_path = get_config_path(name)
  if config_path then
    if spec.ptp == 'viml' then
      spec.setup = string.format('require("%s").entrance()', config_path)
    else
      if spec.setup == true then
        spec.setup = string.format("require('%s').setup()", config_path)
      end
      if spec.config == true then
        spec.config = string.format(
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
  return spec
end

---@param spec PluginSpec
local function strip_unused_config(spec)
  if type(spec) == 'string' then
    return spec
  end ---@cast spec -string
  if is_multi_spec(spec) then
    for i, child in ipairs(spec) do
      spec[i] = strip_unused_config(child)
    end
    return spec
  end ---@cast spec -MultiPluginSpec

  if spec.config == true or spec.setup == true then
    api.notify(
      string.format(
        'Config file expected by spec but does not exist:\n%s\ncanonical name: %s',
        vim.inspect(spec),
        canonical_name(spec)
      ),
      'error'
    )
  end

  if type(spec.setup) == 'boolean' then
    spec.setup = nil
  end
  if type(spec.config) == 'boolean' then
    spec.config = nil
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
    api.notify("source packer's compiled file fail: " .. tostring(err), 'warn')
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

function n(fn, ...)
  if not fn then
    return
  end

  local ok, result = pcall(fn, ...)
  if ok then
    return result
  end
  api.notify(result, 'debug')
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
