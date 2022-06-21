-- https://gitlab.com/yorickpeterse/nvim-pqf.git

local M = {}

function M.setup() end

function M.config()
  local icons = require('utils.icons').diagnostics
  require('pqf').setup {
    signs = {
      error = icons.Error,
      warning = icons.Warn,
      info = icons.Info,
      hint = icons.Hint,
    },
  }
end

return M
