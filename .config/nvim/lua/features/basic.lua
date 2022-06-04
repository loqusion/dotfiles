local basic = require('crows.utils').new_feat()

basic.pre = function()
  vim.g.mapleader = ','
  vim.opt.showbreak = '->'
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.colorcolumn = '120'
end

basic.use 'lewis6991/impatient.nvim'

basic.use {
  'rmagatti/auto-session',
  disabled = true,
}

basic.use {
  'dhruvasagar/vim-prosession',
  requires = 'tpope/vim-obsession',
  after = 'vim-obsession',
  config = function()
    vim.g.prosession_tmux_title = 1
    vim.g.prosession_on_startup = 1
    ---@diagnostic disable-next-line: missing-parameter
    vim.g.prosession_dir = vim.fn.expand '~/.cache/nvim/sessions'
  end,
}

-- improve vim select/input UI
basic.use {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup {
      input = { winblend = 0 },
    }
  end,
}

return basic
