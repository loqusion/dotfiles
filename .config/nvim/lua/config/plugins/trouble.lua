-- https://github.com/folke/trouble.nvim

local M = {
  safe_requires = {
    'trouble',
  },
  icons = require('utils.icons').diagnostics,
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
    ['<localleader>x'] = {
      name = 'lsp trouble',
      x = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
      w = { '<cmd>Trouble workspace_diagnostics<cr>', 'Workspace diagnostics' },
      d = { '<cmd>Trouble document_diagnostics<cr>', 'Document diagnostics' },
      l = { '<cmd>Trouble loclist<cr>', "Items from the window's location list" },
      q = { '<cmd>Trouble quickfix<cr>', 'Quickfix items' },
    },
  }
end

return M
