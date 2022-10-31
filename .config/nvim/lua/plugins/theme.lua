local options = require 'core.options'

local theme = require('crows.utils').new_feat()

theme.use {
  'sainnhe/gruvbox-material',
  'luisiacc/gruvbox-baby',
  'eddyekofo94/gruvbox-flat.nvim',
  'shaunsingh/nord.nvim',
  'sainnhe/edge',
  { 'rose-pine/neovim', as = 'rose-pine' },
  'liuchengxu/space-vim-theme',
  'olimorris/onedarkpro.nvim',
  'rebelot/kanagawa.nvim',
  'EdenEast/nightfox.nvim',
  'Shatur/neovim-ayu',
  'Mofiqul/dracula.nvim',
  { 'mcchrish/zenbones.nvim', requires = 'rktjmp/lush.nvim' },
  { 'catppuccin/nvim', as = 'catppuccin', config = true },
  'folke/tokyonight.nvim',
  'frankier/neovim-colors-solarized-truecolor-only',
  'overcache/NeoSolarized',
  'f-person/auto-dark-mode.nvim',
}

local configs = {
  ['gruvbox-material'] = {
    g = {
      gruvbox_material_enable_italic = 1,
      gruvbox_material_transparent_background = options.transparent_background,
    },
  },
  ['gruvbox-baby'] = {
    g = {
      gruvbox_baby_transparent_mode = options.transparent_background,
    },
  },
  ['gruvbox-flat'] = {
    g = {
      gruvbox_transparent = options.transparent_background,
    },
  },
  ['solarized'] = {
    g = {
      solarized_termtrans = options.transparent_background,
    },
  },
}

for _, config in pairs(configs) do
  for i, settings in pairs(config) do
    if i == 'g' then
      for key, value in pairs(settings) do
        vim.g[key] = value
      end
    end
  end
end

-- This section is here for future reference

---@class Theme
---@field palette table
---@field lualine? string
---@field apply function

---@type table<string, Theme>
local themes = {
  onedarkpro = {
    lualine = 'onedark',
    apply = function()
      vim.cmd [[packadd onedarkpro.nvim]]
      vim.opt.background = 'dark'
      local onedarkpro = require 'onedarkpro'
      onedarkpro.setup {
        options = {
          transparency = vim.g.use_transparency,
          bold = true,
          italic = true,
          underline = true,
          undercurl = true,
        },
        styles = {
          comments = 'italic',
          keywords = 'bold,italic',
        },
      }
      vim.cmd [[colorscheme onedarkpro]]
    end,
  },
  rose_pine_dawn = {
    palette = {
      accent = '#b4637a', -- bg_purple
      accent_sec = '#d7827e', -- grey
      bg = '#f2e9de', -- bg1
      bg_sec = '#e4dfde', -- bg4
      fg = '#575279', -- default:bg1
      fg_sec = '#6e6a86', -- fg
    },
    apply = function()
      vim.cmd [[packadd rose-pine]]
      vim.o.background = 'light'
      vim.cmd [[colorscheme rose-pine]]
    end,
  },
  spacevim_dark = {
    lualine = 'palenight',
    palette = {},
    apply = function()
      vim.cmd [[packadd space-vim-theme]]
      vim.opt.background = 'dark'
      if vim.g.use_transparency then
        vim.g.space_vim_transp_bg = 1
      end
      vim.cmd [[colorscheme space_vim_theme_improved]]
    end,
  },
}

return theme
