-- https://github.com/rizzatti/dash.vim

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config() end

function M.register_global_keys()
  require('utils.api').key.maps {
    K = {
      '<Plug>DashSearch',
      'Search for the word under the cursor in docsets corresponding to the current keyword setup',
    },
    gK = {
      '<Plug>DashGlobalSearch',
      'Search for the word under the cursor in all docsets',
    },
  }
end

return M
