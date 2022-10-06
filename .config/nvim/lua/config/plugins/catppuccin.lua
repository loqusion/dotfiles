-- https://github.com/catppuccin/nvim

local options = require 'core.options'

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
  flavor = flavors.mocha,
}

function M.setup() end

function M.config()
  vim.g.catppuccin_flavor = M.flavor
  M.catppuccin.setup {
    transparent_background = options.transparent_background,
  }

  M.register_global_autocmds()
  vim.cmd [[colorscheme catppuccin]]
end

function M.register_global_autocmds()
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = 'catppuccin',
    command = [[hi CursorLine guibg=#303347 ]],
  })
end

return M
