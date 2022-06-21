-- https://github.com/kana/vim-niceblock

local M = {}

function M.config()
  require('crows').key.maps({
    I = { '<Plug>(niceblock-I)', 'Prepend visual selection' },
    A = { '<Plug>(niceblock-A)', 'Append visual selection' },
  }, { mode = 'x' })
end

return M
