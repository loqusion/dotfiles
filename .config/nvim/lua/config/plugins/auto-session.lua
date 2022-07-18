-- https://github.com/rmagatti/auto-session

local M = {
  safe_requires = {
    { 'auto-session', 'auto_session' },
  },
}

function M.setup() end

function M.config()
  M.auto_session.setup {
    pre_save_cmds = { 'Neotree close', 'TroubleClose' },
    auto_session_suppress_dirs = { '~', '~/repos', '~/notes' },
  }
  M.register_global_keys()
end

function M.register_global_keys()
  require('crows').key.maps {
    ['<Leader>l'] = {
      r = { '<cmd>RestoreSession<cr>', 'Restore session' },
      s = { '<cmd>SaveSession<cr>', 'Save session' },
      d = { '<cmd>DeleteSession<cr>', 'Delete session' },
    },
  }
end

return M
