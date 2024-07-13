local style = require("config.style")

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
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      icons = {
        rules = {
          { plugin = "ChatGPT.nvim", icon = " ", color = "green" },
          __extend = true,
        },
      },
    },
  },

  -- obsidian
  {
    "IlyasYOY/obs.nvim",
    dependencies = { "IlyasYOY/coredor.nvim" },
    cmd = {
      "ObsNvimBacklinks",
      "ObsNvimDailyNote",
      "ObsNvimFindInJournal",
      "ObsNvimFindInNotes",
      "ObsNvimFindNote",
      "ObsNvimFollowLink",
      "ObsNvimMove",
      "ObsNvimNewNote",
      "ObsNvimRename",
      "ObsNvimTemplate",
    },
    opts = {
      vault_home = "~/Documents/Public",
      journal = {
        template_name = "daily",
      },
    },
  },

  -- use common keybinds for navigating multiplexer
  {
    "mrjones2014/smart-splits.nvim",
    cond = vim.env.WEZTERM_UNIX_SOCKET ~= nil,
    lazy = false, -- see https://github.com/mrjones2014/smart-splits.nvim#wezterm
    -- stylua: ignore
    keys = {
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move Cursor Left" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move Cursor Down" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move Cursor Up" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move Cursor Right" },
      { "<M-Left>", function() require("smart-splits").resize_left() end, desc = "Resize Window Left" },
      { "<M-Down>", function() require("smart-splits").resize_down() end, desc = "Resize Window Down" },
      { "<M-Up>", function() require("smart-splits").resize_up() end, desc = "Resize Window Up" },
      { "<M-Right>", function() require("smart-splits").resize_right() end, desc = "Resize Window Right" },
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

  -- auto dark mode (macOS only)
  {
    "cormacrelf/dark-notify",
    enabled = jit.os == "OSX",
    event = "ColorScheme",
    build = "command -V dark-notify || brew install cormacrelf/tap/dark-notify",
    config = function(_, opts)
      require("dark_notify").run(opts)
    end,
  },

  -- auto sync terminal background with neovim colorscheme
  {
    "typicode/bg.nvim",
    lazy = false,
  },

  {
    "tim-harding/neophyte",
    cond = function()
      return require("utils").check_command_exists("neophyte")
    end,
    event = "VeryLazy",
    opts = {
      bg_override = {
        -- #1E1E2E
        r = 30,
        g = 30,
        b = 46,
        a = style.transparent and 230 or 255,
      },
    },
  },
}
