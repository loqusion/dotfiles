-- https://github.com/akinsho/git-conflict.nvim

local M = {}

function M.setup() end

function M.config()
  require('git-conflict').setup {}
end

return M
