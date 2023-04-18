local style = require("config.style")

return {
  { "Shatur/neovim-ayu", event = "VeryLazy" },
  { "catppuccin/nvim", event = "VeryLazy", name = "catppuccin", opts = { transparent_background = style.transparent } },
  { "Mofiqul/dracula.nvim", event = "VeryLazy", opts = { transparent_bg = style.transparent } },
  -- stylua: ignore
  { "sainnhe/edge", event = "VeryLazy", init = function() vim.g.edge_transparent_background = style.transparent end },
  { "ellisonleao/gruvbox.nvim", event = "VeryLazy", opts = { transparent_mode = style.transparent } },
  -- stylua: ignore
  { "luisiacc/gruvbox-baby", event = "VeryLazy", init = function() vim.gruvbox_baby_transparent_mode = style.transparent end },
  { "rebelot/kanagawa.nvim", event = "VeryLazy", opts = { transparent = style.transparent } },
  { "EdenEast/nightfox.nvim", event = "VeryLazy", opts = { options = { transparent = style.transparent } } },
  { "shaunsingh/nord.nvim", event = "VeryLazy" },
  { "olimorris/onedarkpro.nvim", event = "VeryLazy", opts = { options = { transparency = style.transparent } } },
  { "shaunsingh/oxocarbon.nvim", event = "VeryLazy" },
  { "rose-pine/neovim", event = "VeryLazy", name = "rose-pine", opts = { disable_background = style.transparent } },
  -- stylua: ignore
  { "frankier/neovim-colors-solarized-truecolor-only", event = "VeryLazy", init = function() vim.g.solarized_termtrans = style.transparent end },
  -- stylua: ignore
  { "liuchengxu/space-vim-theme", event = "VeryLazy", init = function() vim.g.space_vim_transp_bg = style.transparent end },
  -- stylua: ignore
  { "mcchrish/zenbones.nvim", event = "VeryLazy", dependencies = "rktjmp/lush.nvim", init = function() vim.g.zenbones_transparent_background = style.transparent end },
  -- { 'f-person/auto-dark-mode.nvim', event = 'VeryLazy'},

  { "LazyVim/LazyVim", opts = { colorscheme = style.colorscheme } },
}
