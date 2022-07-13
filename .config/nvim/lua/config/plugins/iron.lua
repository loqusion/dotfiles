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
  local lazy = require 'crows.lazy'
  local key = require('crows').key
  local send_motion = lazy.fn('iron.core', 'run_motion', 'send_motion')

  key.maps({
    ['<Space>'] = {
      i = {
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
end

return M
