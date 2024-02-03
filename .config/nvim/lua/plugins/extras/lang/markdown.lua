return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "markdownlint",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = { "injected", "prettierd" },
        -- ["markdown.mdx"] = { "prettierd" },
      },
      formatters = {
        injected = {
          options = {
            lang_to_formatters = {
              html = {},
              javascript = {},
            },
          },
        },
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.markdownlint,
      })
    end,
  },

  -- paste image
  {
    "ekickx/clipboard-image.nvim",
    cmd = "PasteImg",
    build = 'test "$(uname -s)" = "Darwin" && brew install pngpaste',
  },
}
