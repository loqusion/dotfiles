---@module 'lazy'

---@type LazySpec[]
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

  -- TODO: When https://github.com/stevearc/conform.nvim/pull/625 is merged, use `sqruff`
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
