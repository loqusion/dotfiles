-- https://github.com/tyru/open-browser.vim

local M = {}

function M.entrance()
  M.register_global_keys()
end

function M.register_global_keys()
  local key = require('crows').key
  for _, mode in ipairs { 'n', 'x' } do
    key.map(
      'Open in browser',
      mode,
      'gx',
      "<cmd>call vimrc#github_or_open_browser('" .. mode .. "')<cr>",
      { silent = true }
    )
  end
end

return M
