-- https://github.com/AndrewRadev/splitjoin.vim

local M = {}

function M.entrance()
  vim.g.splitjoin_split_mapping = ''
  vim.g.splitjoin_join_mapping = ''
  M.register_global_keys()
end

function M.register_global_keys()
  require('crows').key.maps({
    ['<Leader>s'] = {
      j = { '<cmd>SplitjoinSplit<cr>', 'Split line' },
      k = { '<cmd>SplitjoinJoin<cr>', 'Join line' },
    },
  }, { silent = true })
end

return M
