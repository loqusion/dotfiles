local rust = {}

rust.lsp_configs = {
  rust_analyzer = {},
}

rust.formatters = {
  rust = {
    function()
      return {
        exe = 'rustfmt',
        args = { '--emit=stdout' },
        stdin = true,
      }
    end,
  },
}

return rust
