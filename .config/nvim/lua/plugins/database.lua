local database = require('utils.api').feat.new()

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
