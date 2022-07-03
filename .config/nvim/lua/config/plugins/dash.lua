-- https://github.com/rizzatti/dash.vim

local M = {}

function M.setup()
  require('crows').key.maps {
    K = {
      '<Plug>DashSearch',
      'Search for the word under the cursor in docsets corresponding to the current keyword setup',
    },
    gK = { '<Plug>DashGlobalSearch', 'Search for the word under the cursor in all docsets' },
  }
end

function M.config() end

return M
