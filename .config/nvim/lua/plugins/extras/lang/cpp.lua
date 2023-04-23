return {
  {
    "neovim/nvim-lspconfig",
    ---@type PluginLspOpts
    opts = {
      setup = {
        clangd = function(_, opts)
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.offsetEncoding = { "utf-16" }
          require("lspconfig").clangd.setup(vim.tbl_deep_extend("force", opts, {
            capabilities = capabilities,
          }))
          return true
        end,
      },
    },
  },
}
