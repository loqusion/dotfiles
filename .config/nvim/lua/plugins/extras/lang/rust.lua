local Utils = require("utils")

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "rust-analyzer",
        "rustfmt",
      })
    end,
  },

  -- rust tools
  {
    "simrat39/rust-tools.nvim",
    enabled = true,
    ft = "rust",
    opts = {
      tools = { inlay_hints = { auto = not Utils.has("lsp-inlayhints.nvim") } },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if Utils.has("rust-tools.nvim") then
        return
      end

      opts.rust_analyzer = {
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
      }
    end,
  },
}
