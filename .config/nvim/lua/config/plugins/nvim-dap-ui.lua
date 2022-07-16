-- https://github.com/rcarriga/nvim-dap-ui

local M = {
  safe_requires = {
    'dapui',
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.dapui.setup()
end

function M.register_global_keys()
  local lazy = require 'crows.lazy'
  local key = require('crows').key

  key.maps {
    ['<F2>'] = { lazy.fn('dapui', 'toggle'), 'Debug UI: Toggle layout' },
    ['<LocalLeader>d'] = {
      S = { lazy.fn('dapui', 'float_element', 'stacks'), 'Debug UI: Show stack frames' },
      w = { lazy.fn('dapui', 'float_element', 'watches'), 'Debug UI: Show watchlist' },
      s = { lazy.fn('dapui', 'float_element', 'scopes'), 'Debug UI: Show scopes' },
      b = { lazy.fn('dapui', 'float_element', 'breakpoints'), 'Debug UI: Show breakpoints' },
      r = { lazy.fn('dapui', 'float_element', 'repl'), 'Debug UI: Show REPL' },
    },
  }
  key.map('Debug UI: Show expression under cursor', { 'n', 'x' }, '<Leader>dh', lazy.fn('dapui', 'eval'))
end

return M
