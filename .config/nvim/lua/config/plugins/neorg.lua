-- https://github.com/nvim-neorg/neorg

local M = {}

function M.setup() end

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
end

return M
