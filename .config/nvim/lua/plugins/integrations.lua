return {
  -- discord presence
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
      enable_line_number = true,
      debounce_timeout = 5,
      main_image = "file",
      neovim_image_text = "hi",
    },
  },

  -- chatgpt
  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPTActAs", "ChatGPT" },
    opts = {},
  },

  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    enabled = false,
    version = "",
    event = "VeryLazy",
    opts = {
      dir = "~/Obsidian/Vault 1",
      completion = {
        nvim_cmp = true,
      },
    },
  },
}
