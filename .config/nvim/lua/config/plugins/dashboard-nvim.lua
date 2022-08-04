-- https://github.com/glepnir/dashboard-nvim

local M = {
  safe_requires = {
    { 'dashboard', 'db' },
  },
}

function M.setup() end

function M.config()
  ---@diagnostic disable-next-line: missing-parameter
  M.db.session_directory = vim.fn.expand(vim.fn.stdpath 'data' .. '/sessions/')
  M.db.custom_header = require('config.dashboard.headers').animegirl2
end

return M
