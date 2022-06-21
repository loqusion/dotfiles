local path = require 'utils.api.path'
local key = require('crows').key

---@return string
local function canonical_name(name)
  return string.match(name, '/([%w%-_]+).?')
end

---@param name string
local function get_config_path(name)
  local file_name = name:lower() .. '.lua'
  local config_path = path.join(vim.fn.stdpath 'config', 'lua/config/plugins', file_name)
  return config_path
end

local function goto_plugin_config()
  local cfile = vim.fn.expand '<cfile>'
  local plugin_name = canonical_name(cfile) or cfile
  local config_path = get_config_path(plugin_name)
  if not path.is_exists(config_path) then
    vim.fn.writefile({
      '-- https://github.com/' .. cfile,
      '',
      'local M = {}',
      '',
      'function M.setup()',
      'end',
      '',
      'function M.config()',
      'end',
      '',
      'return M',
    }, config_path)
  end
  vim.cmd('e ' .. config_path)
end

key.map('Go to plugin config', 'n', 'gp', goto_plugin_config)
