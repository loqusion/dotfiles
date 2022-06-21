-- https://github.com/rcarriga/nvim-dap-ui

local M = {}

function M.setup() end

function M.config()
  require('dapui').setup()
end

return M
