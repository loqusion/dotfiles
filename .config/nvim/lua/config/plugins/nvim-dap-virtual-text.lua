-- https://github.com/theHamsta/nvim-dap-virtual-text

local M = {
  safe_requires = {
    { 'nvim-dap-virtual-text', 'dap_virtual_text' },
  },
}

function M.setup() end

function M.config()
  M.dap_virtual_text.setup {}
end

return M
