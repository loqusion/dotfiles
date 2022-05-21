local map = vim.keymap.set

map('n', 'ys', '<plug>(operator-surround-append)', {silent=true})
map('n', 'ds', '<plug>(operator-surround-delete)a', {silent=true})
map('n', 'cs', '<plug>(operator-surround-replace)a', {silent=true})
