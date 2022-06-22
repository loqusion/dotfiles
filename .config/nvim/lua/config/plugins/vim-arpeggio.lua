-- https://github.com/kana/vim-arpeggio

local M = {}

function M.entrance()
  vim.cmd 'packadd vim-arpeggio'
  vim.g.arpeggio_timeoutlen = 60
  M.register_global_keys()
end

function M.register_global_keys()
  vim.fn['arpeggio#map']('i', '', 0, 'jk', '<Esc>')
end

return M
