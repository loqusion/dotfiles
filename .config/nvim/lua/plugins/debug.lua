local debug = require('crows.utils').new_feat()

debug.use { -- Launch debug sessions, set breakpoints, step through code, inspect state
  'mfussenegger/nvim-dap',
  module = 'dap',
  setup = true,
  config = true,
}

debug.use { -- DAP enhancements
  { -- UI for nvim-dap
    'rcarriga/nvim-dap-ui',
    after = 'nvim-dap',
    setup = true,
    config = true,
  },
  { -- Virtual text support
    'theHamsta/nvim-dap-virtual-text',
    after = 'nvim-dap',
    config = true,
  },
}

debug.use { -- DAP configurations
  { -- JavaScript DAP
    'mxsdev/nvim-dap-vscode-js',
    after = 'nvim-dap',
    config = true,
  },
  {
    'microsoft/vscode-js-debug',
    opt = true,
    run = 'npm install --legacy-peer-deps && npm run compile',
  },
  {
    'jbyuki/one-small-step-for-vimkind',
    after = 'nvim-dap',
  },
  { -- Python DAP
    'mfussenegger/nvim-dap-python',
    after = 'nvim-dap',
    config = true,
  },
}

return debug
