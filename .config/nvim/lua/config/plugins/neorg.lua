-- https://github.com/nvim-neorg/neorg

local M = {}

M.dirman_config = {
  workspaces = {
    work = '~/notes/work',
    home = '~/notes/home',
  },
}

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
      ['core.norg.dirman'] = { config = M.dirman_config },
      ['core.norg.concealer'] = {},
      ['core.norg.completion'] = {
        config = { engine = 'nvim-cmp' },
      },
      ['core.integrations.nvim-cmp'] = {},
      ['core.integrations.telescope'] = {},
    },
  }
end

return M
