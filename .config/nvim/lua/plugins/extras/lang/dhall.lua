---@module 'lazy'

---@type LazySpec[]
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "dhall-lsp",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dhall_lsp_server = {},
      },
    },
  },
}
