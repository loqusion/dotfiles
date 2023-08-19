return {
  {
    "jose-elias-alvarez/null-ls.nvim",
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
