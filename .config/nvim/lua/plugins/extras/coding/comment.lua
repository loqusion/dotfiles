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
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
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
