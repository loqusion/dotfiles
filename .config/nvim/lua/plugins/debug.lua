local debug = require('crows.utils').new_feat()

debug.use {
  { -- Launch debug sessions, set breakpoints, step through code, inspect state
    'mfussenegger/nvim-dap',
    requires = { 'jbyuki/one-small-step-for-vimkind' },
    wants = 'one-small-step-for-vimkind',
    module = 'dap',
    setup = true,
    config = true,
  },
  { -- UI for nvim-dap
    'rcarriga/nvim-dap-ui',
    requires = 'nvim-dap',
    after = 'nvim-dap',
    config = true,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    requires = { 'nvim-dap', 'nvim-treesitter' },
    after = 'nvim-dap',
    config = true,
  },
  { -- Python DAP
    'mfussenegger/nvim-dap-python',
    requires = 'nvim-dap',
    ft = 'python',
    config = [[require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')]],
  },
}

return debug
