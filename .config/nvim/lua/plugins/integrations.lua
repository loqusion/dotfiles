return {
  -- discord presence
  {
    "andweeb/presence.nvim",
    cond = jit.os == "OSX",
    event = "VeryLazy",
    opts = {
      neovim_image_text = "hi",
      main_image = "file",
      enable_line_number = false,
      debounce_timeout = 5,
    },
  },

  -- chatgpt
  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPTActAs", "ChatGPT" },
    keys = {
      {
        "<leader>oc",
        function()
          require("chatgpt").openChat()
        end,
      },
    },
    opts = {},
  },

  -- markdown preview
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>op",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "light" },
  },
}
