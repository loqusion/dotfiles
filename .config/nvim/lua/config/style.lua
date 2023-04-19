local utils = require("config.utils")

return {
  -- {{{
  ---@type
  ---   | 'ayu'
  ---   | 'ayu-dark'
  ---   | 'ayu-light'
  ---   | 'ayu-mirage'
  ---   | 'carbonfox'
  ---   | 'catppucin'
  ---   | 'catppuccin-frappe'
  ---   | 'catppuccin-latte'
  ---   | 'catppuccin-macchiato'
  ---   | 'catppuccin-mocha'
  ---   | 'dawnfox'
  ---   | 'dayfox'
  ---   | 'delek'
  ---   | 'desert'
  ---   | 'duskfox'
  ---   | 'dracula'
  ---   | 'duckbones'
  ---   | 'edge'
  ---   | 'evening'
  ---   | 'forestbones'
  ---   | 'gruvbox'
  ---   | 'gruvbox-baby'
  ---   | 'habamax'
  ---   | 'kanagawa'
  ---   | 'kanagawa-dragon'
  ---   | 'kanagawa-lotus'
  ---   | 'kanagawa-wave'
  ---   | 'kanagawabones'
  ---   | 'lunaperche'
  ---   | 'neobones'
  ---   | 'nightfox'
  ---   | 'nord'
  ---   | 'nordbones'
  ---   | 'nordfox'
  ---   | 'onedark'
  ---   | 'onedark_dark'
  ---   | 'onedark_vivid'
  ---   | 'onelight'
  ---   | 'oxocarbon'
  ---   | 'peachpuff'
  ---   | 'randombones'
  ---   | 'rose-pine'
  ---   | 'rose-pine-dawn'
  ---   | 'rose-pine-main'
  ---   | 'rose-pine-moon'
  ---   | 'rosebones'
  ---   | 'seoulbones'
  ---   | 'shine'
  ---   | 'slate'
  ---   | 'solarized'
  ---   | 'space_vim_theme'
  ---   | 'terafox'
  ---   | 'tokyobones'
  ---   | 'tokyobones'
  ---   | 'tokyonight'
  ---   | 'tokyonight-day'
  ---   | 'tokyonight-moon'
  ---   | 'tokyonight-night'
  ---   | 'tokyonight-storm'
  ---   | 'vimbones'
  ---   | 'zellner'
  ---   | 'zenbones'
  ---   | 'zenburned'
  ---   | 'zenwritten'
  -- }}}
  colorscheme = "carbonfox",
  transparent = (not utils.is_ssh()) and true,
  animation = false,
  -- Border style in floating windows
  ---@type _.NuiBorderStyle
  border = "rounded",
}

-- vim: foldmethod=marker foldlevel=0
