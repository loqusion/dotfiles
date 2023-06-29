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
        desc = "ChatGPT",
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
    opts = { theme = "dark" },
  },

  {
    "mrjones2014/smart-splits.nvim",
    lazy = false, -- see https://github.com/mrjones2014/smart-splits.nvim#wezterm
    -- stylua: ignore
    keys = {
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move Cursor Left" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move Cursor Down" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move Cursor Up" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move Cursor Right" },
      { "<M-S-h>", function() require("smart-splits").resize_left() end, desc = "Resize Window Left" },
      { "<M-S-j>", function() require("smart-splits").resize_down() end, desc = "Resize Window Down" },
      { "<M-S-k>", function() require("smart-splits").resize_up() end, desc = "Resize Window Up" },
      { "<M-S-l>", function() require("smart-splits").resize_right() end, desc = "Resize Window Right" },
      { "<leader><C-h>", function() require("smart-splits").swap_buf_left() end, desc = "Swap Buffer Left" },
      { "<leader><C-j>", function() require("smart-splits").swap_buf_down() end, desc = "Swap Buffer Down" },
      { "<leader><C-k>", function() require("smart-splits").swap_buf_up() end, desc = "Swap Buffer Up" },
      { "<leader><C-l>", function() require("smart-splits").swap_buf_right() end, desc = "Swap Buffer Right" },
    },
    opts = {
      ignored_buftypes = { "NvimTree", "neo-tree" },
      at_edge = "stop",
      cursor_follows_swapped_bufs = true,
    },
  },

  {
    "cormacrelf/dark-notify",
    cond = jit.os == "OSX",
    event = "ColorScheme",
    build = "command -V dark-notify || brew install cormacrelf/tap/dark-notify",
    config = function(_, opts)
      require("dark_notify").run(opts)
    end,
  },
}
