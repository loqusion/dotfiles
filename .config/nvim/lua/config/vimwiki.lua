vim.keymap.set('n', '<leader>ww', '<plug>VimwikiIndex')

vim.cmd [[
  autocmd MyAutoCmd FileType vimwiki setlocal nolist concealcursor=
]]
