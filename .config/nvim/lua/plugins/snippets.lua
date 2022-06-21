local snippets = require('crows.utils').new_feat()

snippets.use {
  'L3MON4D3/LuaSnip',
  requires = 'rafamadriz/friendly-snippets',
  config = true,
}

snippets.use {
  'danymat/neogen',
  requires = 'nvim-treesitter',
  keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  setup = true,
}

return snippets
