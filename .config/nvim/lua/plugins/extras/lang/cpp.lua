return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
        cmake = {},
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },
}
