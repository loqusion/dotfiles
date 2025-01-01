---@type LazySpec[]
return {
  {
    "williamboman/mason.nvim",
    opts = {
      PATH = "append",
      ensure_installed = {
        "selene",
        "stylua",
        "luacheck",
        "shellcheck",
        "shfmt",
        "flake8",
        "actionlint",
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
      inlay_hints = { enabled = true },
      codelens = { enabled = false },
      document_highlight = { enabled = true },
      capabilities = {
        -- workaround for performance issue
        -- see https://github.com/neovim/neovim/issues/23291#issuecomment-1686709265
        workspace = { didChangeWatchedFiles = { dynamicRegistration = false } },
      },
      ---@class lspconfig.options
      servers = {
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        dockerls = {},
        html = {},
        marksman = {},
        svelte = {},
        teal_ls = {},
        vimls = {},
        yamlls = {},
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      -- log_level = vim.log.levels.DEBUG,
      formatters_by_ft = {
        ["_"] = { "trim_whitespace", "trim_newlines" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- lua = { "selene", "luacheck" },
      },
      linters = {
        luacheck = {
          condition = function(ctx)
            return #vim.fs.find({ "luacheckrc" }, { path = ctx.filename, upward = true }) > 0
          end,
        },
        selene = {
          condition = function(ctx)
            return #vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true }) > 0
          end,
        },
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.selene.with({
          condition = function(utils)
            return utils.root_has_file({ "selene.toml" })
          end,
        }),
        nls.builtins.diagnostics.luacheck.with({
          condition = function(utils)
            return utils.root_has_file({ "luacheckrc" })
          end,
        }),
      })
    end,
  },

  -- preview LSP definition
  {
    "rmagatti/goto-preview",
    -- stylua: ignore
    keys = {
      { "<leader>cp", function() require("goto-preview").goto_preview_definition({}) end,     desc = "Preview Definition" },
      -- { "???", function() require("goto-preview").goto_preview_implementation({}) end, desc = "Preview Implementation" },
      { "<leader>cP",  function() require("goto-preview").close_all_win() end,                 desc = "Preview: Close windows" },
    },
    opts = {},
  },
}
