-- https://github.com/rcarriga/nvim-dap-ui

local M = {
  safe_requires = {
    'dapui'
  }
}

function M.setup() end

function M.config()
  M.dapui.setup()
end

return M
