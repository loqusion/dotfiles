local style = require("config.style")

return {
  { "ellisonleao/gruvbox.nvim", event = "VeryLazy" },
  { "shaunsingh/oxocarbon.nvim", event = "VeryLazy" },
  { "catppuccin/nvim", event = "VeryLazy", name = "catppuccin" },
  { "luisiacc/gruvbox-baby", event = "VeryLazy" },
  { "shaunsingh/nord.nvim", event = "VeryLazy" },
  { "sainnhe/edge", event = "VeryLazy" },
  { "rose-pine/neovim", event = "VeryLazy", name = "rose-pine" },
  { "liuchengxu/space-vim-theme", event = "VeryLazy" },
  { "olimorris/onedarkpro.nvim", event = "VeryLazy" },
  { "rebelot/kanagawa.nvim", event = "VeryLazy" },
  { "EdenEast/nightfox.nvim", event = "VeryLazy" },
  { "Shatur/neovim-ayu", event = "VeryLazy" },
  { "Mofiqul/dracula.nvim", event = "VeryLazy" },
  { "mcchrish/zenbones.nvim", event = "VeryLazy", dependencies = "rktjmp/lush.nvim" },
  { "frankier/neovim-colors-solarized-truecolor-only", event = "VeryLazy" },
  -- { 'f-person/auto-dark-mode.nvim', event = 'VeryLazy'},

  { "LazyVim/LazyVim", opts = { colorscheme = style.colorscheme } },
}
