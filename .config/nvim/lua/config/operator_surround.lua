local keymap = vim.keymap
keymap.set('n', 'ys', '<plug>(operator-surround-append)', {silent=true})
keymap.set('n', 'ds', '<plug>(operator-surround-delete)a', {silent=true})
keymap.set('n', 'cs', '<plug>(operator-surround-replace)a', {silent=true})
