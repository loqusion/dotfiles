return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "prettierd",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts, {
        formatters_by_ft = {
          ["javascript"] = { "prettierd" },
          ["javascriptreact"] = { "prettierd" },
          ["typescript"] = { "prettierd" },
          ["typescriptreact"] = { "prettierd" },
          ["vue"] = { "prettierd" },
          ["css"] = { "prettierd" },
          ["scss"] = { "prettierd" },
          ["less"] = { "prettierd" },
          ["html"] = { "prettierd" },
          ["json"] = { "prettierd" },
          ["jsonc"] = { "prettierd" },
          ["yaml"] = { "prettierd" },
          ["markdown"] = { "prettierd" },
          ["markdown.mdx"] = { "prettierd" },
          ["graphql"] = { "prettierd" },
          ["handlebars"] = { "prettierd" },
        },
      })
      return opts
    end,
  },
}
