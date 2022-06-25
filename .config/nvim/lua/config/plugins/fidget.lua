-- https://github.com/j-hui/fidget.nvim

local M = {}

function M.setup() end

function M.config()
  require('fidget').setup {
    window = {
      blend = 100,
    },
  }
end

return M
