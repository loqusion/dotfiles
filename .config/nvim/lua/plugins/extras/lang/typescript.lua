---@module 'lazy'

local style = require("config.style")

local enable_inlay_hints = true

---@type LazySpec[]
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "rustywind",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "jsdoc" })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = enable_inlay_hints },
                functionLikeReturnTypes = { enabled = enable_inlay_hints },
                parameterNames = { enabled = enable_inlay_hints and "literals" or false },
                parameterTypes = { enabled = enable_inlay_hints },
                propertyDeclarationTypes = { enabled = enable_inlay_hints },
                variableTypes = { enabled = false },
              },
            },
          },
        },
      },
    },
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { { "haydenmeade/neotest-jest", dev = false } },
    opts = {
      adapters = {
        ["neotest-jest"] = {},
      },
    },
  },

  {
    "vuki656/package-info.nvim",
    event = "BufRead package.json",
    opts = {
      hide_up_to_date = true,
      package_manager = "pnpm",
    },
    config = function(_, opts)
      require("package-info").setup(opts)
      require("telescope").load_extension("package_info")
    end,
  },

  {
    -- "bennypowers/nvim-regexplainer",
    "loqusion/nvim-regexplainer",
    dev = true,
    -- stylua: ignore
    keys = {
      { "gR", function() require("regexplainer").show() end, desc = "Show Regexplainer (custom)" },
    },
    ---@type RegexplainerOptions
    opts = {
      debug = true,
      mode = "narrative",
      display = "popup",
      ---@class NuiPopupBufferOptions
      popup = {
        border = {
          style = style.border,
          padding = { 0, 1 },
        },
      },
    },
  },
}
