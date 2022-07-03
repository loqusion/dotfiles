local syntax = require('crows.utils').new_feat()

syntax.use { -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' },
    module = 'nvim-treesitter',
    setup = true,
    config = true,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },
  {
    'RRethy/nvim-treesitter-textsubjects',
    after = 'nvim-treesitter',
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    after = 'nvim-treesitter',
  },
  {
    'David-Kunz/treesitter-unit',
    after = 'nvim-treesitter',
  },
  {
    'windwp/nvim-ts-autotag',
    wants = 'nvim-treesitter',
    ft = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'markdown' },
  },
  {
    'RRethy/nvim-treesitter-endwise',
    wants = 'nvim-treesitter',
    after = 'nvim-treesitter',
    -- ft = { 'lua', 'ruby', 'sh', 'vim' },
  },
  {
    'nvim-treesitter/playground',
    wants = 'nvim-treesitter',
    cmd = {
      'TSPlaygroundToggle',
      'TSHighlightCapturesUnderCursor',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
  },
  {
    'lewis6991/spellsitter.nvim',
    after = 'nvim-treesitter',
  },
}

-- better matching
syntax.use {
  'andymass/vim-matchup',
  ptp = 'viml',
  event = { 'BufRead', 'BufNewFile' },
  setup = true,
}

-- color highlighter
syntax.use {
  'norcalli/nvim-colorizer.lua',
  event = { 'BufRead', 'BufNewFile' },
  config = true,
}

syntax.use 'MTDL9/vim-log-highlighting'

syntax.use { -- Better language auto-detection, powered by treesitter
  'spywhere/detect-language.nvim',
  after = 'nvim-treesitter',
  config = true
}

return syntax
