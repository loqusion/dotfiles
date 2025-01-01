---@type LazySpec[]
return {
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment = "",
        comment_line = "",
        textobject = nil, -- keep textobject mapping
      },
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    init = function()
      -- speed up loading
      vim.g.skip_ts_context_commentstring_module = true
    end,
    opts = { enable_autocmd = false },
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
}
