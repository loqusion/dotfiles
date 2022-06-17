local run = require('crows.utils').new_feat()

run.use { -- Quickly interact with the repl without having to leave your work buffer
  'hkupty/iron.nvim',
  setup = function()
    local lazy = require 'crows.lazy'
    local key = require('crows').key
    local send_motion = lazy.fn('iron.core', 'run_motion', 'send_motion')

    key.maps({
      ['<Space>'] = {
        s = {
          name = 'IronRepl',
          l = { lazy.fn('iron.core', 'send_line'), 'Send line' },
          ['.'] = { lazy.fn('iron.core', 'repeat_cmd'), 'Repeat command' },
          ['<CR>'] = { lazy.fn('iron.core', 'send', nil, string.char(13)), 'Send <EOL>' },
          ['<Space>'] = { lazy.fn('iron.core', 'send', nil, string.char(03)), 'Send interrupt' },
          q = { lazy.fn('iron.core', 'close_repl'), 'Exit' },
        },
        cl = { lazy.fn('iron.core', 'send', nil, string.char(12)), 'Clear' },
      },
    }, { silent = true })
    for _, mode in ipairs { 'n', 'x' } do
      key.map('Send motion', mode, '<Space>sc', send_motion, { silent = true })
    end
  end,
  config = function()
    require('iron.core').setup {
      config = {
        should_map_plug = false,
        scratch_repl = true,
        buflisted = false,
        repl_definition = {
          lua = {
            command = { 'croissant' },
          },
          python = {
            command = { 'ptipython' },
          },
        },
      },
    }
  end,
  cmd = { 'IronRepl', 'IronSend', 'IronReplHere' },
  module = 'iron',
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
  'rcarriga/vim-ultest',
  disable = true,
  requires = 'vim-test/vim-test',
  run = ':UpdateRemotePlugins',
  config = function()
    vim.g.ultest_use_pty = 1
    require('crows').key.maps {
      [']t'] = { '<Plug>(ultest-next-fail)', 'Next failed test' },
      ['[t'] = { '<Plug>(ultest-prev-fail)', 'Prev failed test' },
    }
  end,
}
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
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {},
        require 'neotest-vim-test' {
          ignore_filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
        },
      },
    }
  end,
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
  config = function()
    require('config.test').coverage()
  end,
}

return run
