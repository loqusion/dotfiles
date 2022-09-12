local database = require('crows.utils').new_feat()

database.use {
  { -- Interact with databases
    'tpope/vim-dadbod',
    ptp = 'viml',
  },
  { -- UI for dadbod
    'kristijanhusak/vim-dadbod-ui',
    ptp = 'viml',
    cmd = { 'DBUIToggle' },
    setup = true,
  },
}

return database
