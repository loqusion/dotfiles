---@module 'lazy'

---@type LazySpec[]
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      if vim.fn.executable("nix") == 1 then
        vim.list_extend(opts.ensure_installed, {
          "nil",
        })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if vim.fn.executable("nix") ~= 1 then
        opts.servers.nil_ls = false
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        nix = { "alejandra", "nixfmt", stop_after_first = true },
      },
    },
  },
}
