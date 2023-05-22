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
    ---@class PluginLspOpts
    opts = {
      servers = {
        pyright = {
          before_init = function(_, config)
            local venv, python_path = python.get_path(config.root_dir)
            if venv then
              vim.env.VIRTUAL_ENV = venv
              vim.notify(("VIRTUAL_ENV = %s"):format(venv), vim.log.levels.INFO)
            end
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
        nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.pylint.with({}),
        nls.builtins.formatting.autoflake,
        nls.builtins.formatting.isort,
      })
    end,
  },
}
