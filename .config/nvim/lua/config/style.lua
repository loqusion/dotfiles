local should_override_transparent = vim.g.neovide and true or false
local function override_transparent(transparent)
  if should_override_transparent then
    return false
  end
  return transparent
end

return {
  -- {{{
  ---@type
  ---   | 'ayu'
  ---   | 'ayu-dark'
  ---   | 'ayu-light'
  ---   | 'ayu-mirage'
  ---   | 'carbonfox'
  ---   | 'catppuccin'
  ---   | 'catppuccin-frappe'
  ---   | 'catppuccin-latte'
  ---   | 'catppuccin-macchiato'
  ---   | 'catppuccin-mocha'
  ---   | 'dawnfox'
  ---   | 'dayfox'
  ---   | 'delek'
  ---   | 'desert'
  ---   | 'dracula'
  ---   | 'dracula-soft'
  ---   | 'duckbones'
  ---   | 'duskfox'
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
  ---   | 'neosolarized'
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
  colorscheme = "catppuccin-macchiato",
  background = "dark",
  transparent = override_transparent(true),
  animation = false,
  -- Border style in floating windows
  ---@type _.NuiBorderStyle
  border = "rounded",
}

-- vim: foldmethod=marker foldlevel=0
