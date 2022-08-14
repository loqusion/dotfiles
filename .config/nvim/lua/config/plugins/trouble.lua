-- https://github.com/folke/trouble.nvim

local M = {
  safe_requires = {
    'trouble',
  },
  icons = require('utils.icons').diagnostics,
  -- TODO: Change
  map_leader = '<LocalLeader>x',
}

function M.setup() end

function M.config()
  M.trouble.setup {
    signs = {
      error = M.icons.Error,
      warning = M.icons.Warn,
      hint = M.icons.Hint,
      information = M.icons.Info,
      other = '﫠',
    },
  }
  M.register_global_keys()
end

function M.register_global_keys()
  require('crows').key.maps {
    [M.map_leader] = {
      name = 'Trouble',
      x = { '<Cmd>TroubleToggle<CR>', 'Toggle Trouble' },
      w = { '<Cmd>Trouble workspace_diagnostics<CR>', 'Workspace diagnostics' },
      d = { '<Cmd>Trouble document_diagnostics<CR>', 'Document diagnostics' },
      l = { '<Cmd>Trouble loclist<CR>', "Items from the window's location list" },
      q = { '<Cmd>Trouble quickfix<CR>', 'Quickfix items' },
    },
    ['<M-j>'] = { '<Cmd>TroubleToggle<CR>', 'Toggle Trouble' },
  }
end

return M
