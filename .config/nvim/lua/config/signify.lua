local g = vim.g
local map = vim.keymap.set

g.signify_sign_add = '+'
g.signify_sign_add = '+'
g.signify_sign_delete = '_'
g.signify_sign_delete_first_line = '‾'
g.signify_sign_change = '~'
g.signify_sign_change_delete =
  g.signify_sign_change .. g.signify_sign_delete_first_line

map('n', '<leader>gd', '<cmd>SignifyDiff<cr>')
map('n', '<leader>gp', '<cmd>SignifyHunkDiff<cr>')
map('n', '<leader>gu', '<cmd>SignifyHunkUndo<cr>')

map('o', 'ic', '<plug>(signify-motion-inner-pending)')
map('x', 'ic', '<plug>(signify-motion-inner-visual)')
map('o', 'ac', '<plug>(signify-motion-outer-pending)')
map('x', 'ac', '<plug>(signify-motion-outer-visual)')
