return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "prettier",
        "prettierd",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "prettierd", "prettier" },
        ["javascriptreact"] = { "prettierd", "prettier" },
        ["typescript"] = { "prettierd", "prettier" },
        ["typescriptreact"] = { "prettierd", "prettier" },
        ["vue"] = { "prettierd", "prettier" },
        ["css"] = { "prettierd", "prettier" },
        ["scss"] = { "prettierd", "prettier" },
        ["less"] = { "prettierd", "prettier" },
        ["html"] = { "prettierd", "prettier" },
        ["json"] = { "prettierd", "prettier" },
        ["jsonc"] = { "prettierd", "prettier" },
        ["yaml"] = { "prettierd", "prettier" },
        ["markdown"] = { "prettierd", "prettier" },
        ["markdown.mdx"] = { "prettierd", "prettier" },
        ["graphql"] = { "prettierd", "prettier" },
        ["handlebars"] = { "prettierd", "prettier" },
      },
    },
  },
}
