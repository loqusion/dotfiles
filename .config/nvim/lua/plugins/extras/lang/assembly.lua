---@module 'lazy'

---@type LazySpec[]
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "asm-lsp", "asmfmt" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        asm_lsp = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        asm = { "asmfmt" },
      },
    },
  },
}
