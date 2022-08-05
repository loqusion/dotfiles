-- https://github.com/glepnir/dashboard-nvim

local api = require 'utils.api'

local M = {
  safe_requires = {
    { 'dashboard', 'db' },
  },
  session_count = 5,
}

function M.setup() end

function M.config()
  ---@diagnostic disable-next-line: missing-parameter
  M.db.session_directory = vim.fn.expand(vim.fn.stdpath 'data' .. '/sessions/')
  M.db.custom_header = require('config.dashboard.headers').animegirl2
  local ok, custom_center = pcall(M.custom_center)
  if ok then
    M.db.custom_center = custom_center
  else
    api.notify(custom_center, vim.log.levels.ERROR)
  end

  M.dumb_workaround()
end

function M.custom_center()
  local custom_center = {}
  local last_sessions = api.sessions.last(M.session_count)
  for _, session in ipairs(last_sessions) do
    table.insert(custom_center, {
      icon = '',
      desc = ' ' .. session.name,
      action = string.format('lua require("utils.api.sessions").load("%s")', session.file_path),
    })
  end
  return custom_center
end

function M.dumb_workaround()
  vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    once = true,
    callback = function()
      require('config.plugins.persisted').register_global_commands()
    end,
  })
end

return M
