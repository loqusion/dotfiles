-- https://github.com/mfussenegger/nvim-dap-python

local M = {
  safe_requires = {
    { 'dap-python', 'dap_python' },
  },
}

function M.setup() end

function M.config()
  M.dap_python.setup 'python3'
end

return M
