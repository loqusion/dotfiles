local g = vim.g
local map = vim.keymap.set

g.splitjoin_split_mapping = ''
g.splitjoin_join_mapping = ''

map('n', 'sj', '<cmd>SplitjoinSplit<cr>', { silent = true })
map('n', 'sk', '<cmd>SplitjoinJoin<cr>', { silent = true })
