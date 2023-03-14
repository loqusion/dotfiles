-- https://github.com/nvim-neorg/neorg

local M = {
  safe_requires = {
    'neorg',
  },
  mapleader = '<Leader>o',
}

function M.setup()
  M.register_global_keys()

  local group = vim.api.nvim_create_augroup('NeorgCustom', {})
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'norg',
    -- TODO: pass bufnr
    callback = M.register_buffer_keys,
  })
end

function M.config()
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
            journal = '~/notes/journal',
            work = '~/notes/work',
          },
          default_workspace = 'main',
        },
      },
      ['core.norg.qol.toc'] = {},
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
      ['core.norg.journal'] = {
        config = {
          workspace = 'journal',
        },
      },
      ['core.integrations.nvim-cmp'] = {},
      ['core.integrations.telescope'] = {},
      ['core.integrations.treesitter'] = {},
      ['core.export'] = {},
      ['core.export.markdown'] = {
        config = {
          extensions = 'all',
        },
      },
    },
  }

  vim.cmd [[if exists(':NeorgStart') == 2 | NeorgStart silent=true | endif]]
end

function M.register_global_keys()
  require('utils.api').key.maps {
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
  -- TODO: map <Leader>f to = in neorg buffers
  require('utils.api').key.maps {
    [M.mapleader] = {
      p = { '<Cmd>Neorg presenter start<CR>', 'Neorg presenter' },
    },
  }
end

return M
