-- https://github.com/rcarriga/nvim-notify

local M = {
  safe_requires = {
    'notify',
  },
  icons = require('utils.icons').diagnostics
}

function M.setup() end

function M.config()
  M.notify.setup {
    timeout = 5000,
    stages = 'fade_in_slide_out',
    background_colour = '#ffcc66',
    icons = {
      ERROR = M.icons.Error,
      WARN = M.icons.Warn,
      INFO = M.icons.Info,
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
