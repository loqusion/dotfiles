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
        "pylint",
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
          before_init = function(_, config)
            local venv = python.activate_venv(config.root_dir)
            local python_path = python.get_path(venv)
            config.settings.python.pythonPath = python_path
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
        custom.formatting.blackd_client,
        nls.builtins.diagnostics.flake8.with({
          condition = function(utils)
            return utils.root_has_file(".flake8")
          end,
        }),
        nls.builtins.diagnostics.pylint.with({
          condition = function(utils)
            return utils.root_has_file(".pylintrc")
          end,
        }),
        nls.builtins.formatting.autoflake,
        nls.builtins.formatting.isort,
      })
    end,
  },
}
