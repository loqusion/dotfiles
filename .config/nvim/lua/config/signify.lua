local g = vim.g
local keymap = vim.keymap
g.signify_sign_add = '+'
g.signify_sign_add = '+'
g.signify_sign_delete = '_'
g.signify_sign_delete_first_line = '‾'
g.signify_sign_change = '~'
g.signify_sign_change_delete =
  g.signify_sign_change .. g.signify_sign_delete_first_line

keymap.set('n', '<leader>gd', '<cmd>SignifyDiff<cr>')
keymap.set('n', '<leader>gp', '<cmd>SignifyHunkDiff<cr>')
keymap.set('n', '<leader>gu', '<cmd>SignifyHunkUndo<cr>')

keymap.set('o', 'ic', '<plug>(signify-motion-inner-pending)')
keymap.set('x', 'ic', '<plug>(signify-motion-inner-visual)')
keymap.set('o', 'ac', '<plug>(signify-motion-outer-pending)')
keymap.set('x', 'ac', '<plug>(signify-motion-outer-visual)')
