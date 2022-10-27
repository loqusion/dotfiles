-- https://github.com/rmagatti/goto-preview

local M = {
  safe_requires = {
    { 'goto-preview', 'goto_preview' },
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.goto_preview.setup {}
end

function M.register_global_keys()
  local lazy = require 'utils.api.lazy'

  require('crows').key.maps {
    gp = {
      name = 'Preview',

      d = { lazy.fn('goto-preview', 'goto_preview_definition'), 'Goto preview definition' },
      i = { lazy.fn('goto-preview', 'goto_preview_implementation'), 'Goto preview implementation' },
      r = { lazy.fn('goto-preview', 'goto_preview_references'), 'Goto preview references' },
    },
    gP = { lazy.fn('goto-preview', 'close_all_win'), 'Close all preview windows' },
  }
end

return M
