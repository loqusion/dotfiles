---@module 'lazy'

local function pyproject_has_mypy_section(pyproject_file)
  local ok, lines = pcall(vim.fn.readfile, pyproject_file)
  if not ok then
    return false
  end
  -- matches [tool.mypy], [tool.mypy.overrides], [[tool.mypy.overrides]]
  -- but not [tool.mypy_extra] or [tool.mypy-something]
  return table.concat(lines, "\n"):find("%[tool%.mypy[%]%.]") ~= nil
end

local function has_mypy_config(dir)
  if #vim.fs.find({ "mypy.ini" }, { path = dir, upward = true }) > 0 then
    return true
  end
  local pyproject = vim.fs.find({ "pyproject.toml" }, { path = dir, upward = true })[1]
  return pyproject ~= nil and pyproject_has_mypy_section(pyproject)
end

---@type LazySpec[]
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "autoflake",
        "black",
        "isort",
        "mypy",
        "pylint",
        "ruff",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          ---@type vim.lsp.client.on_attach_cb
          on_attach = function(client, _)
            local SHOULD_FILTER_PYRIGHT = false

            if SHOULD_FILTER_PYRIGHT then
              client.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(function(_, result, ctx, config)
                local function filter_pyright(diagnostic)
                  diagnostic = diagnostic or {}
                  local source = diagnostic.source
                  if type(source) ~= "string" then
                    return true
                  end
                  return string.lower(source) ~= "pyright"
                end
                result.diagnostics = vim.tbl_filter(filter_pyright, result.diagnostics)
                vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
              end, {})
            end
          end,
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      local ruff_fix = require("conform").get_formatter_config("ruff_fix")

      return vim.tbl_deep_extend("force", opts, {
        formatters_by_ft = {
          python = { "ruff_sort_imports", "ruff_format" },
        },
        formatters = {
          ruff_sort_imports = vim.tbl_deep_extend("force", ruff_fix, {
            prepend_args = { "--select", "I" },
          }),
        },
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        python = { "mypy" },
      },
      linters = {
        mypy = {
          condition = function(ctx)
            return has_mypy_config(ctx.filename)
          end,
        },
      },
    },
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "nvim-neotest/neotest-python" },
    opts = {
      adapters = {
        ["neotest-python"] = {},
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")

      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.flake8.with({
          condition = function(utils)
            return utils.root_has_file(".flake8")
          end,
        }),
        nls.builtins.diagnostics.mypy.with({
          condition = function(_)
            return has_mypy_config(require("lazyvim.util").root.get())
          end,
          runtime_condition = function(params)
            local root_dir = require("lazyvim.util").root.get()
            local venv = ("%s/.venv"):format(root_dir)
            return vim.startswith(params.bufname, root_dir) and not vim.startswith(params.bufname, venv)
          end,
        }),
        nls.builtins.diagnostics.pylint.with({
          condition = function(utils)
            return utils.root_has_file(".pylintrc")
          end,
        }),
        nls.builtins.formatting.blackd,
      })
    end,
  },
}
