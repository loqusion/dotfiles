local g = vim.g
local map = vim.keymap.set

vim.cmd [[
  let g:grepper = {}
  let g:grepper.searchreg = 1
  let g:grepper.prompt_text = '$c '
]]

map({'n', 'x'}, 'gs', '<plug>(GrepperOperator)')
