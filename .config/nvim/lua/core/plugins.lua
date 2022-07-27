local api = require 'utils.api'

---@type Feature[]
local plugins = {}

local plugin_root_directory = api.path.join(vim.fn.stdpath 'config', 'lua', 'plugins')
local file_list = vim.fn.globpath(plugin_root_directory, '*', false, true)
for _, file in ipairs(file_list) do
  local mod_name = 'plugins.' .. vim.fn.fnamemodify(file, ':t:r')
  local ok, mod = pcall(require, mod_name)
  if ok then
    table.insert(plugins, mod)
  else
    api.notify(mod, vim.log.levels.WARN)
  end
end

require('crows').setup {
  modules = { 'plugins' },
  features = plugins,
}

return plugins
