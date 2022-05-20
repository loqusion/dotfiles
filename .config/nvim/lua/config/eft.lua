local g = vim.g
local keymap = vim.keymap

g.eft_ignorecase = 1

keymap.set('n', ';', '<plug>(eft-repeat)')
keymap.set('x', ';', '<plug>(eft-repeat)')

keymap.set('n', 'f', '<plug>(eft-f)')
keymap.set('x', 'f', '<plug>(eft-f)')
keymap.set('o', 'f', '<plug>(eft-f)')

keymap.set('n', 'F', '<plug>(eft-F)')
keymap.set('x', 'F', '<plug>(eft-F)')
keymap.set('o', 'F', '<plug>(eft-F)')
