-- https://github.com/nvim-neo-tree/neo-tree.nvim

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config() end

function M.register_global_keys()
  require('crows').key.maps {
    ['\\'] = { '<Cmd>Neotree toggle current reveal_force_cwd<CR>', 'Open neotree in current window' },
    ['|'] = { '<Cmd>Neotree reveal reveal_force_cwd<CR>', 'Reveal current file in neotree' },
    gF = { '<Cmd>Neotree float reveal_file=<cfile> reveal_force_cwd<CR>', 'Reveal file under cursor in neotree' },
    ['<LocalLeader>'] = {
      b = { '<Cmd>Neotree toggle show buffers right<CR>', 'Show open buffers in neotree' },
    },
  }
end

return M
