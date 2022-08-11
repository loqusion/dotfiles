-- https://gitlab.com/yorickpeterse/nvim-pqf.git

local M = {
  safe_requires = {
    'pqf',
  },
}

function M.setup() end

function M.config()
  local icons = require('utils.icons').diagnostics
  M.pqf.setup {
    signs = {
      error = icons.Error,
      warning = icons.Warn,
      info = icons.Info,
      hint = icons.Hint,
    },
  }
end

return M
