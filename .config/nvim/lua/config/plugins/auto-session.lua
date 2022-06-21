-- https://github.com/rmagatti/auto-session

local M = {}

function M.setup() end

function M.config()
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
end

return M
