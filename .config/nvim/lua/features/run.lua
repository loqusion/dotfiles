local run = require('crows.utils').new_feat()

run.use { -- Quickly interact with the repl without having to leave your work buffer
  'hkupty/iron.nvim',
  setup = [[require('config.iron_setup')]],
  config = [[require('config.iron')]],
  cmd = { 'IronRepl', 'IronSend', 'IronReplHere' },
  module = 'iron',
}

run.use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

return run
