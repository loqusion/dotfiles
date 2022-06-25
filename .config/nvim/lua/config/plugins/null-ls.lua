-- https://github.com/jose-elias-alvarez/null-ls.nvim

local M = {}

function M.setup() end

function M.config()
  local null_ls = require 'null-ls'
  local diagnostics = null_ls.builtins.diagnostics
  local actions = null_ls.builtins.code_actions

  require('crows.lsp').setup_null_ls {
    sources = {
      diagnostics.eslint,
      -- diagnostics.shellcheck,
      -- diagnostics.teal,
      -- diagnostics.vint,
      actions.gitsigns,
      actions.refactoring.with { filetypes = { 'javascript', 'typescript', 'lua', 'python' } },
      actions.eslint,
    },
  }
end

return M
