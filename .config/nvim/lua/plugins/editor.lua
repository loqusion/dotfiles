return {
  -- window picker for neo-tree
  {
    "s1n7ax/nvim-window-picker",
    version = "",
    config = true,
  },

  -- motions respect camelCase, snake_case, etc
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
    init = function()
      vim.g.wordmotion_mappings = {
        aw = "av",
        iw = "iv",
        ["<C-R><C-W>"] = "",
      }
    end,
  },

  -- neorg
  {
    "nvim-neorg/neorg",
    ft = "norg",
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
          config = { engine = "nvim-cmp" },
        },
        ["core.integrations.nvim-cmp"] = {},
      },
    },
  },
}
