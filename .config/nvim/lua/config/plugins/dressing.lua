-- https://github.com/stevearc/dressing.nvim

local M = {
  safe_requires = {
    'dressing',
  },
}

function M.setup() end

function M.config()
  M.dressing.setup {
    input = {
      win_options = {
        winblend = 0,
      },
    },
  }
end

return M
