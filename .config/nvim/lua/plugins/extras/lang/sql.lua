---@module 'lazy'

local sql_ft = { "sql", "mysql", "plsql" }

---@type LazySpec[]
return {
  -- Remove sqlfluff from upstream config
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      for i, v in ipairs(opts.ensure_installed) do
        if v == "sqlfluff" then
          table.remove(opts.ensure_installed, i)
          break
        end
      end
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      for _, ft in ipairs(sql_ft) do
        for i, v in ipairs(opts.linters_by_ft[ft]) do
          if v == "sqlfluff" then
            table.remove(opts.linters_by_ft[ft], i)
            break
          end
        end
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters.sqlfluff = nil
      for _, ft in ipairs(sql_ft) do
        for i, v in ipairs(opts.formatters_by_ft[ft]) do
          if v == "sqlfluff" then
            table.remove(opts.formatters_by_ft[ft], i)
            break
          end
        end
      end
    end,
  },

  {
    "tpope/vim-dadbod",
    dependencies = {
      {
        "tpope/vim-dispatch",
        init = function()
          vim.g.dispatch_no_maps = 1
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      for _, ft in ipairs(sql_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        table.insert(opts.linters_by_ft[ft], "sqruff")
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      for _, ft in ipairs(sql_ft) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "sqruff")
      end
    end,
  },
}
