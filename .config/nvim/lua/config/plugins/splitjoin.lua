-- https://github.com/AndrewRadev/splitjoin.vim

local M = {}

function M.config()
  vim.g.splitjoin_split_mapping = ''
  vim.g.splitjoin_join_mapping = ''
  require('crows').key.maps({
    ['<Leader>'] = {
      j = { '<cmd>SplitjoinSplit<cr>', 'Split line' },
      k = { '<cmd>SplitjoinJoin<cr>', 'Join line' },
    },
  }, { silent = true })
end

return M
