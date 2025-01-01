---@type LazySpec[]
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- TODO: enable when nginx-language-server supports Python >=3.12
      -- vim.list_extend(opts.ensure_installed, { "nginx-language-server" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- nginx_language_server = {},
      },
    },
  },
}
