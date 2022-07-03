-- https://github.com/folke/trouble.nvim

local M = {}

function M.setup() end

function M.config()
  local signs = require('utils.icons').diagnostics
  require('trouble').setup {
    signs = {
      error = signs.Error,
      warning = signs.Warn,
      hint = signs.Hint,
      information = signs.Info,
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
