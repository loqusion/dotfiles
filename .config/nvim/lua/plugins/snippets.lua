local snippets = require('crows.utils').new_feat()

snippets.use {
  'danymat/neogen',
  requires = 'nvim-treesitter',
  keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  setup = true,
}

return snippets
