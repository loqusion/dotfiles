local go = {}

go.lsp_configs = {
  gopls = {},
  golangci_lint_ls = {},
}

go.formatters = {
  go = {
    function()
      return {
        exe = 'goimports',
        args = { '-w' },
        stdin = false,
      }
    end,
  },
}

return go
