-- https://github.com/nvim-neo-tree/neo-tree.nvim

local options = require 'core.options'

local M = {
  safe_requires = {
    { 'neo-tree', 'neo_tree' },
  },
  transparent_overrides = {
    NeoTreeNormal = {
      bg = 'NONE',
    },
    NeoTreeNormalNC = {
      bg = 'NONE',
    },
    NeoTreeFloatBorder = {
      bg = 'NONE',
    },
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
    filesystem = {
      hijack_netrw_behavior = 'open_current',
    },
    window = {
      position = 'float',
    },
  }

  if options.transparent_background then
    for name, val in pairs(M.transparent_overrides) do
      vim.api.nvim_set_hl(0, name, val)
    end
  end
end

function M.register_global_keys()
  require('utils.api').key.maps {
    ['\\'] = { '<Cmd>Neotree toggle float reveal_force_cwd<CR>', 'Open neotree in floating window' },
    ['|'] = { '<Cmd>Neotree toggle left<CR>', 'Reveal current file in neotree' },
    gF = { '<Cmd>Neotree float reveal_file=<cfile> reveal_force_cwd<CR>', 'Reveal file under cursor in neotree' },
    [vim.g.vscodeleader] = {
      b = { '<Cmd>Neotree toggle show buffers right<CR>', 'Show open buffers in neotree' },
    },
  }
end

return M
