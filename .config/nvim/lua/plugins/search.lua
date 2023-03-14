local search = require('utils.api').feat.new()

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
    'telescope-zoxide',
  },
  cmd = 'Telescope',
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
    'jvgrootveld/telescope-zoxide',
    after = 'telescope.nvim',
  },
}

search.use { -- Quickfix
  { 'https://gitlab.com/yorickpeterse/nvim-pqf.git', config = true },
  -- 'kevinhwang91/nvim-bqf',
  'romainl/vim-qf',
  'Olical/vim-enmasse',
}

search.use {
  'mhinz/vim-grepper',
  cmd = 'Grepper',
  keys = '<Plug>(GrepperOperator)',
  setup = function()
    vim.cmd [[
      let g:grepper = {}
      let g:grepper.searchreg = 1
      let g:grepper.prompt_text = '$c '
    ]]
    vim.cmd [[command! Todo Grepper -noprompt -tool git -query -E '(TODO|FIXME|BUG|XXX):']]
  end,
}

search.use { -- *, #, n, N, etc
  {
    'kevinhwang91/nvim-hlslens',
    disable = true, -- functionality provided by noice.nvim
    module = 'hlslens',
    setup = true,
    config = true,
  },
  {
    'haya14busa/vim-asterisk',
    ptp = 'viml',
    event = { 'BufRead', 'BufNewFile' },
    setup = true,
  },
}

search.use { -- Structural search and replace
  'cshuaimin/ssr.nvim',
  module = 'ssr',
  setup = true,
  config = true,
}

return search
