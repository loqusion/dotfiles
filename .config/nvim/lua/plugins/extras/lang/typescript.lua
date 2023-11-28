local style = require("config.style")

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
    opts = function(_, opts)
      local inlay_hints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
      local extra_opts = {
        settings = {
          typescript = { inlayHints = inlay_hints },
          javascript = { inlayHints = inlay_hints },
        },
      }

      opts.servers.tsserver = vim.tbl_deep_extend("force", opts.servers.tsserver, extra_opts)
      opts.servers.denols = {}
    end,
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
