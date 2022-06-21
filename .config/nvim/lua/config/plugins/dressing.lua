-- https://github.com/stevearc/dressing.nvim

local M = {}

function M.setup() end

function M.config()
  require('dressing').setup {
    input = { winblend = 0 },
  }
end

return M
