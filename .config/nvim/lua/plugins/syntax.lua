local syntax = require('crows.utils').new_feat()

-- better matching
syntax.use {
  'andymass/vim-matchup',
  config = true,
}

-- color highlighter
syntax.use {
  'norcalli/nvim-colorizer.lua',
  ft = {
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'sass',
    'scss',
    'typescript',
    'typescriptreact',
    'vim',
    'vue',
  },
  config = true,
}

-- treesitter
syntax.use {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufRead', 'BufNewFile' },
  run = ':TSUpdate',
  config = true,
}

syntax.use {
  'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter',
}

syntax.use {
  'JoosepAlviste/nvim-ts-context-commentstring',
  after = 'nvim-treesitter',
}

syntax.use {
  'David-Kunz/treesitter-unit',
  after = 'nvim-treesitter',
}

syntax.use {
  'windwp/nvim-ts-autotag',
  wants = 'nvim-treesitter',
  ft = { 'html', 'javascriptreact', 'typescriptreact', 'vue', 'markdown' },
}

syntax.use {
  'RRethy/nvim-treesitter-endwise',
  wants = 'nvim-treesitter',
  ft = { 'lua', 'ruby', 'sh', 'vim' },
}

syntax.use {
  'nvim-treesitter/playground',
  wants = 'nvim-treesitter',
  cmd = 'TSPlaygroundToggle',
}

syntax.use {
  'nvim-treesitter/nvim-treesitter-context',
  after = 'nvim-treesitter',
}

syntax.use 'MTDL9/vim-log-highlighting'

return syntax
