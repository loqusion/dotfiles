-- https://github.com/kana/vim-niceblock

local M = {}

function M.entrance()
  M.register_global_keys()
end

function M.register_global_keys()
  require('crows').key.maps({
    I = { '<Plug>(niceblock-I)', 'Prepend visual selection' },
    A = { '<Plug>(niceblock-A)', 'Append visual selection' },
  }, { mode = 'x' })
end

return M
