---@module 'lazy'

---@type LazySpec[]
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "gdtoolkit")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {},
      },
      -- setup = {
      --   gdscript = function(_, opts)
      --     opts.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      --   end,
      -- },
    },
  },
}
