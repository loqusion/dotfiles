return {
  {
    "tpope/vim-dadbod",
    dependencies = {
      {
        "tpope/vim-dispatch",
        init = function()
          vim.g.dispatch_no_maps = 1
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters.sqlfluff = {
        args = { "lint", "--format=json" },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters.sqlfluff = {
        args = { "format", "-" },
      }
    end,
  },
}
