---@type Feature
local theme = {}

local function table_keys(t)
  local keys = {}
  local n = 1
  for key in pairs(t) do
    keys[n] = key
    n = n + 1
  end
  return keys
end

---@class Theme
---@field palette table
---@field lualine? string
---@field apply function

---@type table<string, Theme>
local themes = {
  edge_light = {
    palette = {
      accent = '#bf75d6', -- bg_purple
      accent_sec = '#8790a0', -- grey
      bg = '#eef1f4', -- bg1
      bg_sec = '#dde2e7', -- bg4
      fg = '#33353f', -- default:bg1
      fg_sec = '#4b505b', -- fg
    },
    apply = function()
      vim.cmd [[packadd edge]]
      vim.opt.background = 'light'
      vim.g.edge_enable_italic = 1
      vim.cmd [[colorscheme edge]]
    end,
  },
  gruvbox_light = {
    lualine = 'gruvbox_light',
    palette = {
      accent = '#d65d0e', -- orange
      accent_sec = '#7c6f64', -- fg4
      bg = '#ebdbb2', -- bg1
      bg_sec = '#d5c4a1', -- bg2
      fg = '#504945', -- fg2
      fg_sec = '#665c54', -- fg3
    },
    apply = function()
      vim.cmd [[packadd gruvbox-material]]
      vim.opt.background = 'light'
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = vim.g.use_transparency
      vim.cmd [[colorscheme gruvbox-material]]
    end,
  },
  gruvbox_dark = {
    lualine = 'gruvbox_dark',
    palette = {
      accent = '#d65d0e', -- orange
      accent_sec = '#a89984', -- fg4
      bg = '#3c3836', -- bg1
      bg_sec = '#504945', -- bg2
      fg = '#d5c4a1', -- fg2
      fg_sec = '#bdae93', -- fg3
    },
    apply = function()
      vim.cmd [[packadd gruvbox-material]]
      vim.opt.background = 'dark'
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = vim.g.use_transparency
      vim.cmd [[colorscheme gruvbox-material]]
    end,
  },
  nord = {
    lualine = 'nord',
    palette = {
      accent = '#88c0d0', -- nord8
      accent_sec = '#81a1c1', -- nord9
      bg = '#3b4252', -- nord1
      bg_sec = '#4c566a', -- nord3
      fg = '#e5e9f0', -- nord4
      fg_sec = '#d8dee9', -- nord4
    },
    apply = function()
      vim.cmd [[packadd nord.nvim]]
      vim.opt.background = 'dark'
      vim.g.nord_borders = true
      require('nord').set()
      vim.cmd [[colorscheme nord]]
    end,
  },
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

vim.g.use_transparency = true
local used_theme = themes.gruvbox_dark

---@diagnostic disable-next-line: missing-parameter
local source_file = vim.fn.expand '<sfile>'
local function colorscheme_command(args)
  local colorscheme = args.args
  used_theme = themes[colorscheme]
  if used_theme then
    used_theme.apply()
  else
    local err_fmt =
      "Error: color scheme '%s' does not have a defined configuration. Add it to themes in %s or install it manually."
    vim.notify(string.format(err_fmt, colorscheme, source_file), vim.log.levels.ERROR, {})
  end
end

theme.pre = function()
  vim.opt.termguicolors = true
end
theme.plugins = {
  { 'sainnhe/gruvbox-material', opt = true },
  { 'shaunsingh/nord.nvim', opt = true },
  { 'sainnhe/edge', opt = true },
  { 'rose-pine/neovim', opt = true, as = 'rose-pine' },
  { 'liuchengxu/space-vim-theme', opt = true },
  { 'olimorris/onedarkpro.nvim', opt = true },
  { 'rebelot/kanagawa.nvim', opt = true },
  { 'luisiacc/gruvbox-baby', opt = true },
  { 'eddyekofo94/gruvbox-flat.nvim', opt = true },
  { 'EdenEast/nightfox.nvim', opt = true },
  { 'Shatur/neovim-ayu', opt = true },
  { 'Mofiqul/dracula.nvim', opt = true },
  { 'mcchrish/zenbones.nvim', opt = true, requires = 'rktjmp/lush.nvim' },
  { 'catppuccin/nvim', opt = true, as = 'catppuccin' },
  { 'folke/tokyonight.nvim', opt = true },
  {
    'f-person/auto-dark-mode.nvim',
    event = 'VimEnter',
    config = function()
      -- require("config.theme").setup()
    end,
  },
}
theme.post = function()
  used_theme.apply()
  theme.palette = used_theme.palette
  theme.lualine = used_theme.lualine or 'auto'

  vim.api.nvim_create_user_command('Colorscheme', colorscheme_command, {
    complete = function()
      return table_keys(themes)
    end,
    nargs = 1,
  })
end

return theme
