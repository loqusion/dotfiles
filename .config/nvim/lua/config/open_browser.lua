local keymap = vim.keymap
local fn = vim.fn

keymap.set('n', 'gx',
  [[<cmd>call vimrc#github_or_open_browser('n')<cr>]],
  { silent = true }
)
keymap.set('x', 'gx',
  [[<cmd>call vimrc#github_or_open_browser('v')<cr>]],
  { silent = true }
)
