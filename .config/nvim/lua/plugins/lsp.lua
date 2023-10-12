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
        "markdownlint",
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
        html = {},
        marksman = {},
        svelte = {},
        teal_ls = {},
        vimls = {},
        yamlls = {},
      },
      capabilities = {
        -- workaround for performance issue
        -- see https://github.com/neovim/neovim/issues/23291#issuecomment-1686709265
        workspace = { didChangeWatchedFiles = { dynamicRegistration = false } },
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
      formatters = {},
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        luacheck = {
          condition = function(ctx)
            return vim.fs.find({ "luacheckrc" }, { path = ctx.filename, upward = true })
          end,
        },
        selene = {
          condition = function(ctx)
            return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })
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
        nls.builtins.diagnostics.markdownlint,
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

  -- inlay hints
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "LspAttach",
    config = function(_, opts)
      require("lsp-inlayhints").setup(opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            require("lsp-inlayhints").on_attach(client, args.buf)
          end
        end,
      })
    end,
  },

  -- preview LSP definition
  {
    "rmagatti/goto-preview",
    -- stylua: ignore
    keys = {
      { "gpd", function() require("goto-preview").goto_preview_definition({}) end,     desc = "Preview Definition" },
      { "gpi", function() require("goto-preview").goto_preview_implementation({}) end, desc = "Preview Implementation" },
      { "gP",  function() require("goto-preview").close_all_win() end,                 desc = "Preview: Close windows" },
    },
    opts = {},
  },
}
