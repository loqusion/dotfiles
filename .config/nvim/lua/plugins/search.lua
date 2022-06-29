local crows = require 'crows'
local search = require('crows.utils').new_feat()

search.post = function()
  crows.key.map('Clear search', 'n', '<leader>/', '<cmd>nohlsearch<cr>')
end

search.use 'romainl/vim-qf'
search.use 'Olical/vim-enmasse'
search.use { 'https://gitlab.com/yorickpeterse/nvim-pqf.git', config = true }

search.use {
  'mhinz/vim-grepper',
  disable = true,
  cmd = 'Grepper',
  keys = '<plug>(GrepperOperator)',
  setup = function()
    vim.cmd [[
      let g:grepper = {}
      let g:grepper.searchreg = 1
      let g:grepper.prompt_text = '$c '
    ]]
    vim.cmd [[command! Todo Grepper -noprompt -tool git -query -E '(TODO|FIXME|BUG|XXX):']]
  end,
}

-- telescope
search.use {
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  },
  wants = {
    'popup.nvim',
    'plenary.nvim',
    'telescope-frecency.nvim',
    'telescope-fzf-native.nvim',
    'telescope-dap.nvim',
    'telescope-ui-select.nvim',
    'telescope-file-browser.nvim',
    'telescope-repo.nvim',
    'session-lens',
  },
  module = 'telescope',
  setup = true,
  config = true,
}

search.use {
  {
    'tami5/sqlite.lua',
    after = 'impatient.nvim',
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    requires = 'tami5/sqlite.lua',
    wants = 'sqlite.lua',
    after = 'telescope.nvim',
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    after = 'telescope.nvim',
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    after = 'telescope.nvim',
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    after = 'telescope.nvim',
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    after = 'telescope.nvim',
  },
  {
    'cljoly/telescope-repo.nvim',
    after = 'telescope.nvim',
  },
  {
    'rmagatti/session-lens',
    after = 'telescope.nvim',
    module = 'session-lens',
  },
}

return search
