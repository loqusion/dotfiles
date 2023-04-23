local Utils = require("utils")

return {
  -- rust tools
  {
    "simrat39/rust-tools.nvim",
    enabled = false,
    ft = "rust",
    opts = {
      tools = { inlay_hints = { auto = not Utils.has("lvimuser/lsp-inlayhints.nvim") } },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            procMacro = { enable = true },
            cargo = { allFeatures = true },
            ---@diagnostic disable-next-line: assign-type-mismatch
            checkOnSave = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
          },
        },
      },
    },
  },
}
