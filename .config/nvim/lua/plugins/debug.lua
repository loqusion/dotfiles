local debug = require('crows.utils').new_feat()

debug.use { -- Launch debug sessions, set breakpoints, step through code, inspect state
  'mfussenegger/nvim-dap',
  requires = { 'jbyuki/one-small-step-for-vimkind' },
  wants = 'one-small-step-for-vimkind',
  module = 'dap',
  setup = true,
  config = true,
}

debug.use { -- DAP enhancements
  { -- UI for nvim-dap
    'rcarriga/nvim-dap-ui',
    after = 'nvim-dap',
    config = true,
  },
  { -- Virtual text support
    'theHamsta/nvim-dap-virtual-text',
    after = 'nvim-dap',
    config = true,
  },
}

debug.use { -- DAP configurations
  { -- Python DAP
    'mfussenegger/nvim-dap-python',
    after = 'nvim-dap',
    config = [[require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')]],
  },
}

return debug
