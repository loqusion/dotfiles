-- https://github.com/jose-elias-alvarez/null-ls.nvim

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config()
  local ok, m = pcall(require, 'null-ls')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s: %s', require('utils.api.path').current_filename(true), m),
      vim.log.levels.ERROR
    )
    return
  end

  M.null_ls = m

  local diagnostics = M.null_ls.builtins.diagnostics
  local actions = M.null_ls.builtins.code_actions
  local formatting = M.null_ls.builtins.formatting

  require('crows.lsp').setup_null_ls {
    sources = {
      formatting.prettier,
      formatting.stylua,
      diagnostics.eslint,
      -- diagnostics.shellcheck,
      -- diagnostics.teal,
      -- diagnostics.vint,
      -- actions.gitsigns,
      -- actions.refactoring.with { filetypes = { 'javascript', 'typescript', 'lua', 'python' } },
      -- actions.eslint,
    },
  }
end

function M.register_global_keys()
  require('crows').key.maps({
    ['<Leader>'] = {
      f = { vim.lsp.buf.formatting, 'Format' },
    },
  }, {})
end

return M
