---@param formatters_by_ft table<string, string[]>
local function update_formatters(formatters_by_ft)
  for lang, formatters_list in pairs(formatters_by_ft) do
    if vim.iter(formatters_list):any(function(formatter)
      return formatter == "prettier"
    end) then
      formatters_by_ft[lang] = { "prettierd" }
    end
  end
end

---@type LazySpec[]
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "prettierd",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      update_formatters(opts.formatters_by_ft)
      return opts
    end,
  },
}
