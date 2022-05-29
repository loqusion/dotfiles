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
