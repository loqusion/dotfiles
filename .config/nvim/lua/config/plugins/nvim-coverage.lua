-- https://github.com/andythigpen/nvim-coverage

local M = {}

function M.setup() end

function M.config()
  require('config.test').coverage()
end

return M
