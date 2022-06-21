-- https://github.com/zbirenbaum/copilot.lua

local M = {}

function M.setup() end

function M.config()
  vim.defer_fn(function()
    require('copilot').setup()
  end, 100)
end

return M
