-- https://github.com/catppuccin/nvim

local options = require('core.options')

local flavors = {
  frappe = 'frappe',
  latte = 'latte',
  macchiato = 'macchiato',
  mocha = 'mocha',
}
local M = {
  safe_requires = {
    'catppuccin',
  },
  flavor = flavors.macchiato,
}

function M.setup() end

function M.config()
  vim.g.catppuccin_flavor = M.flavor
  M.catppuccin.setup {
    transparent_background = options.transparent_background,
  }
  vim.cmd [[colorscheme catppuccin]]
end

return M
