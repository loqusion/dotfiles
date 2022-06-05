local run = require('crows.utils').new_feat()

run.use { -- Quickly interact with the repl without having to leave your work buffer
  'hkupty/iron.nvim',
  setup = function()
    local lazy_require = require('crows.utils').lazy_require
    local key = require('crows').key
    local send_motion = lazy_require('iron.core', 'run_motion', 'send_motion')

    key.maps({
      ['<Space>'] = {
        s = {
          name = 'IronRepl',
          l = { lazy_require('iron.core', 'send_line'), 'Send line' },
          ['.'] = { lazy_require('iron.core', 'repeat_cmd'), 'Repeat command' },
          ['<CR>'] = { lazy_require('iron.core', 'send', nil, string.char(13)), 'Send <EOL>' },
          ['<Space>'] = { lazy_require('iron.core', 'send', nil, string.char(03)), 'Send interrupt' },
          q = { lazy_require('iron.core', 'close_repl'), 'Exit' }
        },
        cl = { lazy_require('iron.core', 'send', nil, string.char(12)), 'Clear' },
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

run.use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

return run
