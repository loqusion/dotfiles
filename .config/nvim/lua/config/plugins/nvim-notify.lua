-- https://github.com/rcarriga/nvim-notify

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'notify')
  if not ok then
    return
  end

  local icons = require('utils.icons').diagnostics

  M.notify = m
  M.notify.setup {
    timeout = 5000,
    stages = 'fade_in_slide_out',
    background_colour = '#ffcc66',
    icons = {
      ERROR = icons.Error,
      WARN = icons.Warn,
      INFO = icons.Info,
      DEBUG = '',
      TRACE = '✎',
    },
    on_open = function(winnr)
      -- non-zero 'winblend' makes the background opaque
      vim.api.nvim_win_set_option(winnr, 'winblend', 0)
    end,
  }
  vim.notify = M.notify
end

return M
