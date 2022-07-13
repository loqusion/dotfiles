---@diagnostic disable: missing-parameter
-- https://github.com/nvim-neotest/neotest

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config()
  local ok, m = pcall(require, 'neotest')
  if not ok then
    return
  end

  M.neotest = m

  M.neotest.setup {
    icons = {
      running = '↻',
    },
    adapters = {
      -- TODO: use neotest-jest when it gets better
      -- require 'neotest-jest' {
      --   jestCommand = 'yarn test --',
      -- },
      require 'neotest-python' {
        -- runner = 'pytest',
      },
      require 'neotest-vim-test' {
        ignore_filetypes = {
          -- 'javascript',
          -- 'typescript',
          -- 'javascriptreact',
          -- 'typescriptreact',
          'python',
        },
      },
    },
  }
end

function M.register_global_keys()
  local lazy = require 'crows.lazy'
  local neotest = lazy.require 'neotest'

  require('crows').key.maps {
    ['<Leader>n'] = {
      name = 'Neotest',
      r = {
        function()
          neotest.run.run(vim.fn.expand '%')
        end,
        'Run all tests in file',
      },
      s = {
        function()
          neotest.run.run { suite = true }
        end,
        'Run test suite',
      },
      n = {
        function()
          neotest.run.run()
        end,
        'Run nearest test',
      },
      d = {
        function()
          neotest.run.run { strategy = 'dap' }
        end,
        'Debug nearest test',
      },
      l = { lazy.fn('neotest', 'run.run_last'), 'Run last test' },
      D = {
        function()
          neotest.run.run_last { strategy = 'dap' }
        end,
        'Debug last test',
      },
      a = { lazy.fn('neotest', 'run.attach'), 'Attach to running test' },
      o = {
        function()
          neotest.output.open { enter = true }
        end,
        'Open test output',
      },
      O = {
        function()
          neotest.output.open { enter = true, short = true }
        end,
        'Open short test output',
      },
      p = {
        lazy.fn('neotest', 'summary.toggle'),
        'Toggle summary',
      },
      m = {
        lazy.fn('neotest', 'summary.run_marked'),
        'Summary for marked tests',
      },
    },
    ['[t'] = {
      function()
        neotest.jump.prev { status = 'failed' }
      end,
      'Goto previous failed test',
    },
    [']t'] = {
      function()
        neotest.jump.next { status = 'failed' }
      end,
      'Goto next failed test',
    },
  }
end

return M
