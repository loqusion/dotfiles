---@module 'lazy'

---@type LazySpec[]
return {
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")

      vim.list_extend(opts.sources, {
        nls.builtins.formatting.fnlfmt.with({
          filetypes = { "fennel", "fnl" },
        }),
      })
    end,
  },
}
