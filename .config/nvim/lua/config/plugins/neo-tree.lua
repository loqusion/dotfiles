-- https://github.com/nvim-neo-tree/neo-tree.nvim

local M = {
  safe_requires = {
    { 'neo-tree', 'neo_tree' },
  },
}

function M.setup() end

function M.config()
  M.register_global_keys()
  vim.g.neo_tree_remove_legacy_commands = 1

  M.neo_tree.setup {
    default_component_configs = {
      icon = {
        default = '',
      },
    },
    window = {
      position = 'current',
    },
  }
end

function M.register_global_keys()
  require('crows').key.maps {
    ['\\'] = { '<Cmd>Neotree toggle current reveal_force_cwd<CR>', 'Open neotree in current window' },
    ['|'] = { '<Cmd>Neotree reveal reveal_force_cwd<CR>', 'Reveal current file in neotree' },
    gF = { '<Cmd>Neotree float reveal_file=<cfile> reveal_force_cwd<CR>', 'Reveal file under cursor in neotree' },
    [vim.g.vscodeleader] = {
      b = { '<Cmd>Neotree toggle show buffers right<CR>', 'Show open buffers in neotree' },
    },
  }
end

return M
