-- https://github.com/haya14busa/vim-asterisk

local M = {}

function M.entrance()
  vim.g['asterisk#keeppos'] = 1
end

function M.register_global_mappings()
  require('utils.api').key.maps({
    ['*'] = { '<Plug>(asterisk-z*)', '' },
    ['#'] = { '<Plug>(asterisk-z#)', '' },
    ['g*'] = { '<Plug>(asterisk-gz*)', '' },
    ['g#'] = { '<Plug>(asterisk-gz#)', '' },
  }, { mode = { 'n', 'x' } }, false)
end

return M
