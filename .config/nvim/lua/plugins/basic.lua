local basic = require('crows.utils').new_feat()

basic.use 'lewis6991/impatient.nvim'

basic.use 'antoinemadec/FixCursorHold.nvim'

basic.use {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      -- pre_save_cmds = { 'NvimTreeClose' },
      auto_session_suppress_dirs = { '~', '~/Projects', '~/vimwiki' },
    }
    require('crows').key.maps {
      ['<Leader>l'] = {
        r = { '<cmd>RestoreSession<cr>', 'Restore session' },
        s = { '<cmd>SaveSession<cr>', 'Save session' },
        d = { '<cmd>DeleteSession<cr>', 'Delete session' },
      },
    }
  end,
}

-- improve vim select/input UI
basic.use {
  'stevearc/dressing.nvim',
  config = function()
    require('dressing').setup {
      input = { winblend = 0 },
    }
  end,
}

return basic
