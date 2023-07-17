return {
  -- contextual keybinds
  {
    "anuvyklack/hydra.nvim",
    keys = {
      { "zl", desc = "Scroll right" },
      { "zh", desc = "Scroll left" },
      { "zL", desc = "Half screen to the right" },
      { "zH", desc = "Half screen to the left" },
    },
    config = function()
      local Hydra = require("hydra")
      Hydra({
        name = "Side scroll",
        mode = "n",
        body = "z",
        heads = {
          { "h", "5zh" },
          { "l", "5zl" },
          { "H", "zH" },
          { "L", "zL" },
        },
        config = { hint = false },
      })
    end,
  },

  -- jk = <Esc>
  {
    "kana/vim-arpeggio",
    event = "InsertEnter",
    init = function()
      vim.g.arpeggio_timeoutlen = 50
    end,
    config = function()
      vim.fn["arpeggio#map"]("i", "", 0, "jk", "<Esc>")
      -- Full-width jk during IME
      vim.fn["arpeggio#map"]("i", "", 0, "ｊｋ", "<Esc>")
    end,
  },

  -- copy-paste over ssh with osc52
  {
    "ibhagwan/smartyank.nvim",
    event = "VeryLazy",
    opts = {
      -- we already have this
      highlight = { enabled = false },
    },
  },

  -- paste image in markdown
  {
    "ekickx/clipboard-image.nvim",
    cmd = "PasteImg",
    build = 'test "$(uname -s)" = "Darwin" && brew install pngpaste',
  },

  -- execute project-specific config
  {
    "klen/nvim-config-local",
    cond = not vim.o.exrc,
    lazy = false,
    opts = {
      config_files = { ".nvim.lua", ".nvimrc", ".vimrc.lua", ".vimrc" },
    },
  },

  -- open links without netrw, and more
  --    (lazy.nvim, github issues, package.json dependencies, brewfile)
  {
    "chrishrb/gx.nvim",
    event = "VeryLazy",
    config = true,
  },
}
