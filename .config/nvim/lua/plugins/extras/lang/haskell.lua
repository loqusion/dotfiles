---Return the first index matching the given predicate.
---If no items match the predicate, return nil.
---
---@generic T
---@param tbl T[]
---@param predicate fun(t: T): boolean
---@return integer?
local function tbl_find(tbl, predicate)
  for i, v in ipairs(tbl) do
    if predicate(v) then
      return i
    end
  end
  return nil
end

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "hlint",
        "ormolu",
      })

      ---@cast opts { ensure_installed: string[] }
      local idx = tbl_find(opts.ensure_installed, function(t)
        return t == "haskell-language-server"
      end)
      if idx ~= nil then
        table.remove(opts.ensure_installed, idx)
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        haskell = { "ormolu" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        haskell = { "hlint" },
      },
    },
  },
}
