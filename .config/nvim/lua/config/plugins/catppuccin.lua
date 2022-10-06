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
  highlight_overrides = {
    CursorLine = {
      bg = '#303347',
    },
  },
}

function M.setup() end

function M.config()
  vim.g.catppuccin_flavor = M.flavor
  M.catppuccin.setup {
    compile = {
      enable = true,
    },
    transparent_background = options.transparent_background,
  }

  M.register_global_autocmds()
  vim.cmd [[colorscheme catppuccin]]
end

function M.register_global_autocmds()
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = 'catppuccin',
    callback = function()
      for name, val in pairs(M.highlight_overrides) do
        vim.api.nvim_set_hl(0, name, val)
      end
    end,
  })
end

return M
