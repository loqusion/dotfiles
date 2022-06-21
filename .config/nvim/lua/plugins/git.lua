local git = require('crows.utils').new_feat()

git.use 'tpope/vim-fugitive'
git.use 'tpope/vim-rhubarb'

git.use { 'akinsho/git-conflict.nvim', config = true }

git.use {
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = true,
}

git.use {
  'TimUntersberger/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  cmd = 'Neogit',
  config = true,
}

git.use {
  'haydenmeade/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = true,
}

return git
