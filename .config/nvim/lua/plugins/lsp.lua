local prefer = {
  lsp_inlay_hints = true,
}

local Util = require("lazyvim.util")

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "someone-stole-my-name/yaml-companion.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        virtual_text = {
          prefix = "icons",
        },
      },
      ---@type lspconfig.options
      servers = {
        bashls = {},
        cssls = {},
        dockerls = {},
        -- denols = {},
        gopls = {
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
        html = {},
        marksman = {},
        pyright = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              ---@diagnostic disable-next-line: assign-type-mismatch
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
        svelte = {},
        teal_ls = {},
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        vimls = {},
        yamlls = {},
      },
    },
  },

  -- inlay hints
  {
    "lvimuser/lsp-inlayhints.nvim",
    cond = prefer.lsp_inlay_hints,
    event = "LspAttach",
    opts = {},
    config = function(_, opts)
      require("lsp-inlayhints").setup(opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          ---@diagnostic disable-next-line: missing-parameter
          require("lsp-inlayhints").on_attach(client, args.buf)
        end,
      })
    end,
  },

  -- rust tools
  {
    "simrat39/rust-tools.nvim",
    enabled = false,
    ft = "rust",
    opts = {
      tools = { inlay_hints = { auto = not prefer.lsp_inlay_hints } },
    },
  },

  -- yaml schemas
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "someone-stole-my-name/yaml-companion.nvim",
    },
    opts = function(_, opts)
      if Util.has("yaml-companion.nvim") then
        local yaml_companion = require("yaml-companion")
        opts.servers.yamlls = yaml_companion.setup(opts.servers.yamlls)
      end
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      if Util.has("yaml-companion.nvim") then
        require("telescope").load_extension("yaml_schema")
      end
    end,
  },

  {
    "rmagatti/goto-preview",
    -- stylua: ignore
    keys = {
      ---@diagnostic disable-next-line: missing-parameter
      { "gpd", function() require("goto-preview").goto_preview_definition() end, desc = "Preview Definition" },
      ---@diagnostic disable-next-line: missing-parameter
      { "gpi", function() require("goto-preview").goto_preview_implementation() end, desc = "Preview Implementation" },
      { "gP", function() require("goto-preview").close_all_win() end, desc = "Preview: Close windows" },
    },
    opts = {},
  },
}
