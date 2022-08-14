local git = require('crows.utils').new_feat()

git.use { -- A Git wrapper so awesome, it should be illegal
  'tpope/vim-fugitive',
  cmd = {
    'G',
    'Git',
    'Ggrep',
    'Glgrep',
    'Gclog',
    'Gllog',
    'Gcd',
    'Glcd',
    'Ge',
    'Gedit',
    'Gsplit',
    'Gvsplit',
    'Gtabedit',
    'Gpedit',
    'Gdrop',
    'Gr',
    'Gread',
    'Gw',
    'Gwrite',
    'Gwq',
    'Gdiffsplit',
    'Gvdiffsplit',
    'Ghdiffsplit',
    'GMove',
    'GRename',
    'GDelete',
    'GRemove',
    'GUnlink',
    'GBrowse',
  },
}
git.use { -- Open GitHub URLs, omni-complete issues, issue URLs, and collaborators
  'tpope/vim-rhubarb',
  after = 'vim-fugitive',
}
git.use { -- Same, but for GitLab
  'shumphrey/fugitive-gitlab.vim',
  after = 'vim-fugitive',
}

git.use { -- Visualize and resolve conflicts
  'akinsho/git-conflict.nvim',
  tag = 'v1.0.0',
  event = { 'BufRead', 'BufNewFile' },
  config = true,
}

git.use { -- Super fast git decorations
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  event = { 'BufRead', 'BufNewFile' },
  config = true,
}

git.use { -- Git porcelain inside vim
  'TimUntersberger/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  cmd = 'Neogit',
  module = 'neogit',
  config = true,
}

git.use {
  -- TODO: use pwntester/octo.nvim
  'haydenmeade/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  cmd = 'Octo',
  module = 'octo',
  config = true,
}

return git
