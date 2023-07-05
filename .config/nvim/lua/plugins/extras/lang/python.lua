local python = require("utils.python")

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "autoflake",
        "black",
        "blackd-client",
        "isort",
        "mypy",
        "pylint",
        "ruff",
        "ruff-lsp",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    ---@type PluginLspOpts
    opts = {
      servers = {
        ---@type lspconfig.options.pyright
        pyright = {
          ---@param client lsp.Client
          on_attach = function(client, _)
            client.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(function(_, result, ctx, config)
              local function filter_pyright(diagnostic)
                return string.lower(diagnostic.source) ~= "pyright"
              end
              result.diagnostics = vim.tbl_filter(filter_pyright, result.diagnostics)
              vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
            end, {})
          end,
          before_init = function(_, config)
            local venv = python.activate_venv(config.root_dir)
            local python_path = python.get_path(venv)
            config.settings.python.pythonPath = python_path
          end,
        },
        ruff_lsp = {
          ---@param client lsp.Client
          on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
          end,
          before_init = function(_, config)
            local venv = python.activate_venv(config.root_dir)
            local python_path = python.get_path(venv)
            config.settings.interpreter = { python_path }
          end,
        },
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      local custom = {
        formatting = {
          blackd_client = nls.builtins.formatting.black.with({
            meta = {
              url = "https://github.com/disrupted/blackd-client",
              description = "black, as a daemon, for improved formatting speed",
            },
            generator_opts = {
              command = "blackd-client",
              args = {},
              to_stdin = true,
            },
          }),
        },
      }

      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.flake8.with({
          condition = function(utils)
            return utils.root_has_file(".flake8")
          end,
        }),
        nls.builtins.diagnostics.mypy.with({
          extra_args = function(utils)
            local venv = python.activate_venv(utils.root_dir)
            local python_path = python.get_path(venv)
            return { "--python-executable", python_path }
          end,
        }),
        nls.builtins.diagnostics.pylint.with({
          condition = function(utils)
            return utils.root_has_file(".pylintrc")
          end,
        }),
        custom.formatting.blackd_client,
        nls.builtins.formatting.ruff,
      })
    end,
  },
}
