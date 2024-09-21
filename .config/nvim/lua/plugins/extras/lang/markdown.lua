local style = require("config.style")

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "markdownlint",
      })
    end,
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
    opts = function(_, opts)
      local injected = require("conform").get_formatter_config("injected")

      return vim.tbl_deep_extend("force", opts, {
        formatters_by_ft = {
          ["markdown"] = function(bufnr)
            local filetypes = vim.split(vim.bo[bufnr].filetype, ".", { plain = true })
            if vim.list_contains(filetypes, "mdx") then
              return {
                "injected_custom",
                "prettierd",
              }
            end
            return { "injected_custom", "prettierd" }
          end,
        },
        formatters = {
          -- formatting MDX with injected will change the semantics unless we override it
          -- (prettier handles html and javascript formatting anyway)
          injected_custom = vim.tbl_deep_extend("force", injected, {
            options = {
              lang_to_formatters = {
                html = {},
                javascript = {},
              },
            },
          }),
        },
      })
    end,
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

  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = function(_, opts)
      if style.transparent then
        opts.code.style = "language"
        opts.heading.backgrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        }
      end

      return opts
    end,
  },

  {
    "loqusion/experimental_mdx.nvim",
    name = "mdx.nvim",
    dev = true,
    lazy = false,
  },

  {
    "jxnblk/vim-mdx-js",
    enabled = false,
    event = "BufReadPre",
  },

  -- paste image
  {
    "ekickx/clipboard-image.nvim",
    cmd = "PasteImg",
    build = 'test "$(uname -s)" = "Darwin" && brew install pngpaste',
  },
}
