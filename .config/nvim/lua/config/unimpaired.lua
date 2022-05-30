local map = vim.keymap.set

local default_conceallevel = vim.go.conceallevel ~= 0 and vim.go.conceallevel or 2

map('n', '<Plug>(unimpaired-enable)a', '<Cmd>set conceallevel=' .. default_conceallevel .. '<CR>')
map('n', '<Plug>(unimpaired-disable)a', '<Cmd>set conceallevel=0<CR>')
map(
  'n',
  '<Plug>(unimpaired-toggle)a',
  ':<C-U>set conceallevel=<C-R>=&conceallevel == 0 ? ' .. default_conceallevel .. ' : 0<CR><CR>'
)

function _G._unmap_unimpaired()
  local unmap = vim.keymap.del
  unmap('n', '<s')
  unmap('n', '<s<Esc>')
  unmap('n', '<p')
  unmap('n', '<P')
  unmap('n', '>s')
  unmap('n', '>s<Esc>')
  unmap('n', '>p')
  unmap('n', '>P')
end

if vim.v.vim_did_enter == 1 then
  _unmap_unimpaired()
else
  vim.cmd [[autocmd VimEnter * ++once lua _unmap_unimpaired()]]
end
