-- https://github.com/hkupty/iron.nvim

local M = {
  safe_requires = {
    { 'iron.core', 'iron_core' },
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.iron_core.setup {
    config = {
      should_map_plug = false,
      scratch_repl = true,
      buflisted = false,
      repl_open_cmd = 'botright 15 split',
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
end

function M.register_global_keys()
  local lazy = require 'utils.api.lazy'
  local key = require('utils.api').key

  key.maps({
    ['y'] = {
      ['<CR>'] = { '<Cmd>IronRepl<CR>', 'Open REPL' },
      r = { lazy.fn('iron.core', 'run_motion', 'visual_send'), 'REPL: Send motion' },
      rr = { lazy.fn('iron.core', 'send_line'), 'REPL: Send line' },
      ['r<CR>'] = { 'yrae', 'REPL: Send buffer', remap = true },
    },
  }, { silent = true })
  key.map('Send motion', 'x', 'R', lazy.fn('iron.core', 'run_motion', 'visual_send', { silent = true }))
end

return M
