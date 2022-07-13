-- https://github.com/folke/lsp-colors.nvim

local M = {
  safe_requires = {
    { 'lsp-colors', 'lsp_colors' },
  },
}

function M.setup() end

function M.config()
  M.lsp_colors.setup {
    Error = '#db4b4b',
    Warning = '#e0af68',
    Information = '#0db9d7',
    Hint = '#10B981',
  }
end

return M
