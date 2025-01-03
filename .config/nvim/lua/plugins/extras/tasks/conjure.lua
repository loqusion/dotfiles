---@module 'lazy'

---@type LazySpec[]
return {
  -- conjure
  {
    "Olical/conjure",
    event = "VeryLazy",
    init = function()
      require("lazyvim.util").on_load("which-key.nvim", function()
        require("which-key").register({
          mode = { "n" },
          ["<localleader>e"] = { name = "+evaluate" },
          ["<localleader>ec"] = { name = "+comment" },
          ["<localleader>l"] = { name = "+log" },
          -- ["<localleader>c"] = { name = "+repl" },
          -- ["<localleader>r"] = { name = "+reset" },
        })
      end)
      vim.g["conjure#mapping#prefix"] = "<localleader>"
      vim.g["conjure#mapping#doc_word"] = false
      vim.g["conjure#mapping#def_word"] = false

      vim.g["conjure#extract#tree_sitter#enabled"] = true

      -- TODO: add virtualenv support
      vim.g["conjure#client#python#stdio#command"] = "python3 -iq"

      vim.api.nvim_create_autocmd("BufNewFile", {
        group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
        pattern = { "conjure-log-*" },
        callback = function(event)
          vim.diagnostic.disable(event.buf)
        end,
        desc = "Conjure Log disable LSP diagnostics",
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "PaterJason/cmp-conjure" },
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "conjure" })
    end,
  },
}
