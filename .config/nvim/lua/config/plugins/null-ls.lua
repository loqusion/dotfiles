-- https://github.com/jose-elias-alvarez/null-ls.nvim

local M = {
  safe_requires = {
    { 'null-ls', 'null_ls' },
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  local diagnostics = M.null_ls.builtins.diagnostics
  local actions = M.null_ls.builtins.code_actions
  local formatting = M.null_ls.builtins.formatting

  require('crows.lsp').setup_null_ls {
    sources = {
      formatting.prettierd,
      formatting.stylua,
      formatting.yapf,
      formatting.rustfmt,
      formatting.shellharden,
      formatting.stylish_haskell,
      diagnostics.shellcheck,
      -- diagnostics.teal,
      -- diagnostics.vint,
      -- actions.shellcheck,
      -- actions.gitsigns,
      -- actions.refactoring.with { filetypes = { 'javascript', 'typescript', 'lua', 'python' } },
      actions.eslint,
    },
  }
end

function M.register_global_keys()
  require('utils.api').lsp.map_formatting()
end

function M.has_formatter(filetype)
  local sources = require 'null-ls.sources'
  local available_formatters = sources.get_available(filetype, 'NULL_LS_FORMATTING')
  return #available_formatters > 0
end

return M
