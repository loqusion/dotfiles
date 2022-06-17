-- https://github.com/kana/vim-arpeggio

local M = {}

function M.config()
  vim.fn['arpeggio#map']('i', '', 0, 'jk', '<Esc>')
  vim.g.arpeggio_timeoutlen = 60
end

return M
