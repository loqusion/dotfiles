return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "typst-lsp" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typst_lsp = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        typst = { "typstfmt" },
      },
    },
  },

  {
    "kaarmu/typst.vim",
    ft = "typst",
  },
}
