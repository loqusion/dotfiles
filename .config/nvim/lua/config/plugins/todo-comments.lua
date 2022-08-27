-- https://github.com/folke/todo-comments.nvim

local api = require 'utils.api'

local M = {
  safe_requires = {
    { 'todo-comments', 'todo_comments' },
  },
  map_leader = require('config.plugins.trouble').map_leader,
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.todo_comments.setup {}
end

local function register_keys_from_config(config_name)
  local ok, mod = pcall(require, 'config.plugins.' .. config_name)
  if ok then
    if not pcall(mod.register_global_keys_for_todo) then
      api.notify(
        string.format('function `register_global_keys_for_todo` does not exist in config %s', config_name),
        'warn'
      )
    end
  else
    api.notify(string.format('Failed to load todo keymaps from %s: %s', config_name, mod), vim.log.levels.WARN)
  end
end

function M.register_global_keys()
  register_keys_from_config 'trouble'
  register_keys_from_config 'telescope'
end

return M
