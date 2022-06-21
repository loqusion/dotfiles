local run = require('crows.utils').new_feat()

run.use { -- Quickly interact with the repl without having to leave your work buffer
  'hkupty/iron.nvim',
  cmd = { 'IronRepl', 'IronSend', 'IronReplHere' },
  module = 'iron',
  setup = true,
  config = true,
}

run.use {
  'tpope/vim-dispatch',
  cmd = { 'Dispatch', 'Make', 'Focus', 'Start' },
  keys = {
    'm<CR>',
    'm<Space>',
    'm!',
    'm?',
    '`<CR>',
    '`<Space>',
    '`!',
    '`?',
    "'<CR>",
    "'<Space>",
    "'!",
    "'?",
    "g'<CR>",
    "g'<Space>",
    "g'!",
    "g'?",
  },
}

-- testing
run.use {
  'nvim-neotest/neotest',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/neotest-vim-test',
    'akinsho/neotest-go',
    'haydenmeade/neotest-jest',
    'vim-test/vim-test',
  },
  config = true,
}
run.use {
  'andythigpen/nvim-coverage',
  cmd = {
    'Coverage',
    'CoverageLoad',
    'CoverageShow',
    'CoverageHide',
    'CoverageToggle',
    'CoverageClear',
    'CoverageSummary',
  },
  module = 'coverage',
  config = true,
}

return run
