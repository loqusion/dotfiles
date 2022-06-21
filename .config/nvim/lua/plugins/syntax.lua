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
  run = ':TSUpdate',
  requires = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
    },
    'JoosepAlviste/nvim-ts-context-commentstring',
    {
      'David-Kunz/treesitter-unit',
      config = function()
        require('crows').key.map('Select treesitter unit', 'x', 'iu', ':lua require("treesitter-unit").select()<CR>')
        require('crows').key.map(
          'Select treesitter unit',
          'x',
          'au',
          ':lua require("treesitter-unit").select(true)<CR>'
        )
        require('crows').key.map(
          'Select treesitter unit',
          'o',
          'iu',
          ':<C-u>lua require("treesitter-unit").select()<CR>'
        )
        require('crows').key.map(
          'Select treesitter unit',
          'o',
          'au',
          ':<C-u>lua require("treesitter-unit").select(true)<CR>'
        )
      end,
    },
    {
      'windwp/nvim-ts-autotag',
      after = 'nvim-treesitter',
      ft = { 'html', 'javascriptreact', 'typescriptreact', 'vue', 'markdown' },
    },
    {
      'RRethy/nvim-treesitter-endwise',
      ft = { 'lua', 'ruby', 'sh', 'vim' },
    },
    {
      'nvim-treesitter/playground',
      after = 'nvim-treesitter',
      cmd = 'TSPlaygroundToggle',
    },
  },
  config = true,
}

syntax.use 'nvim-treesitter/nvim-treesitter-context'

syntax.use 'MTDL9/vim-log-highlighting'

return syntax
