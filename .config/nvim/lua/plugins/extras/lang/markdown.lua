---@module 'lazy'

local style = require("config.style")

---@type LazySpec[]
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "markdownlint-cli2",
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint-cli2" },
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
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = function(_, opts)
      if style.transparent then
        opts = vim.tbl_deep_extend("force", opts or {}, {
          anti_conceal = {
            enabled = true,
          },
          code = {
            disable_background = true,
            border = "none",
          },
          heading = {
            backgrounds = {
              "RenderMarkdownH1",
              "RenderMarkdownH2",
              "RenderMarkdownH3",
              "RenderMarkdownH4",
              "RenderMarkdownH5",
              "RenderMarkdownH6",
            },
          },
        })
      end

      return vim.tbl_deep_extend("force", opts, {
        file_types = vim.list_extend(opts.file_types or {}, { "markdown", "norg", "rmd", "org" }),
      })
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
}
