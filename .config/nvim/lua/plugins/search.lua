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
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim' },
    { 'nvim-telescope/telescope-dap.nvim', after = 'telescope.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim', after = 'telescope.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'cljoly/telescope-repo.nvim' },
    { 'rmagatti/session-lens' },
  },
  wants = {
    'popup.nvim',
    'plenary.nvim',
    'telescope-frecency.nvim',
    'telescope-fzf-native.nvim',
  },
  module = 'telescope',
  setup = true,
  config = true,
}

return search
