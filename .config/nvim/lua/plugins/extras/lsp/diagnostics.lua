local Utils = require("utils")

return {
  -- render diagnostics using virtual lines on top of the real lines of code
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = Utils.augroup("lsp_lines"),
        pattern = { "lazy" },
        callback = function(event)
          -- FIXME: Buffer's diagnostics will be re-enabled when
          -- global diagnostics is toggled on
          vim.diagnostic.disable(event.buf)
        end,
      })
    end,
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = function(_, opts)
      opts.diagnostics.virtual_text = false
      opts.diagnostics.virtual_lines = true
    end,
  },
}
