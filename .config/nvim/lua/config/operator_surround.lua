local map = vim.keymap.set

map({ 'n', 'x' }, 'sa', '<plug>(operator-surround-append)', { silent = true })
map( 'n' , 'sd', '<plug>(operator-surround-delete)a', { silent = true })
map( 'n', 'sc', '<plug>(operator-surround-replace)a', { silent = true })
map('x', 'sd', '<plug>(operator-surround-delete)', { silent = true })
map( 'x', 'sc', '<plug>(operator-surround-replace)', { silent = true })
