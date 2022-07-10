-- https://github.com/nvim-neorg/neorg

local M = {
  mapleader = '<Leader>o',
}

function M.setup()
  M.register_global_keys()

  local group = vim.api.nvim_create_augroup('NeorgCustom', {})
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'norg',
    callback = M.register_buffer_keys,
  })
end

function M.config()
  local ok, m = pcall(require, 'neorg')
  if not ok then
    return
  end

  M.neorg = m
  M.neorg.setup {
    load = {
      ['core.defaults'] = {},
      ['core.norg.concealer'] = {
        config = {
          icon_preset = 'diamond',
        },
      },
      ['core.norg.dirman'] = {
        config = {
          workspaces = {
            main = '~/notes',
            gtd = '~/notes/gtd',
            example_gtd = '~/repos/gtd/gtd',
          },
          default_workspace = 'main',
        },
      },
      ['core.norg.completion'] = {
        config = { engine = 'nvim-cmp' },
      },
      ['core.gtd.base'] = {
        config = {
          workspace = 'gtd',
        },
      },
      ['core.presenter'] = {
        config = {
          zen_mode = 'truezen',
        },
      },
      ['core.norg.journal'] = {},
      ['core.export'] = {},
      ['core.export.markdown'] = {
        config = {
          extensions = 'all',
        },
      },
      ['core.integrations.nvim-cmp'] = {},
      ['core.integrations.telescope'] = {},
      ['core.integrations.treesitter'] = {},
    },
  }

  vim.cmd [[NeorgStart silent=true]]
end

function M.register_global_keys()
  require('crows').key.maps {
    [M.mapleader] = {
      name = 'Neorg commands (global)',
      s = { '<Cmd>NeorgStart<CR>', 'Start Neorg' },
      g = { '<Cmd>Neorg workspace gtd<CR>', 'Neorg gtd' },
      j = { '<Cmd>Neorg journal<CR>', 'Neorg journal' },
      ['<Space>'] = { ':Neorg<Space>', ':Neorg<Space>', silent = false },
    },
  }
end

function M.register_buffer_keys()
  require('crows').key.maps {
    [M.mapleader] = {
      p = { '<Cmd>Neorg presenter start<CR>', 'Neorg presenter' },
    },
  }
end

return M
