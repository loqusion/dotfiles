-- https://github.com/mhinz/vim-sayonara

local M = {}

function M.entrance()
  M.register_global_keys()
end

function M.register_global_keys()
  require('utils.api').key.maps {
    ['<Leader>'] = {
      q = { '<Cmd>Sayonara<CR>', 'Sayonara' },
      Q = { '<Cmd>Sayonara!<CR>', 'Sayonara!' },
    },
  }
end

return M
