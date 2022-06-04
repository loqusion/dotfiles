local config = require 'crows'

---@type Feature
local basic = { plugins = {} }

basic.pre = function()
  vim.g.mapleader = ','
  vim.opt.showbreak = '->'
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.colorcolumn = '120'
end

basic.plugins = {}

basic.plugins[#basic.plugins + 1] = 'lewis6991/impatient.nvim'

basic.plugins[#basic.plugins + 1] = {
  'rmagatti/auto-session',
  disabled = true,
}

-- improve vim select/input UI
basic.plugins[#basic.plugins + 1] = {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup {
      input = { winblend = 0 },
    }
  end,
}

return basic
