local go = {}

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

go.lsp_configs = {
  gopls = {},
  golangci_lint_ls = {},
}

return go
