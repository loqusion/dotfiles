local run = require('utils.api').feat.new()

run.use { -- Asynchronous build and test dispatcher
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

run.use { -- Neotest
  { -- An extensible framework for interacting with tests in NeoVim
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
    },
    wants = {
      'neotest-jest',
      'neotest-python',
      'neotest-go',
      'neotest-vim-test',
    },
    module = 'neotest',
    setup = true,
    config = true,
  },
  -- Neotest adapters
  { -- Jest testing
    'haydenmeade/neotest-jest',
    after = 'neotest',
  },
  { -- Python testing
    'nvim-neotest/neotest-python',
    after = 'neotest',
  },
  { -- Go testing
    'akinsho/neotest-go',
    after = 'neotest',
  },
  { -- Fallback
    'nvim-neotest/neotest-vim-test',
    requires = 'vim-test/vim-test',
    after = 'neotest',
  },
}

run.use { -- Display test coverage in the sign column
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

run.use { -- A fast Neovim http client written in Lua
  'NTBBloodbath/rest.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = true,
}

run.use { -- Quickly interact with the repl without having to leave your work buffer
  'hkupty/iron.nvim',
  cmd = { 'IronRepl', 'IronSend', 'IronReplHere' },
  module = 'iron',
  setup = true,
  config = true,
}

return run
