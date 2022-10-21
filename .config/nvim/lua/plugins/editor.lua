local editor = require('crows.utils').new_feat()

editor.use { -- arpeggio
  'kana/vim-arpeggio',
  ptp = 'viml',
  event = 'InsertEnter',
  setup = true,
}

-- sleuth
editor.use 'tpope/vim-sleuth'

editor.use 'tpope/vim-abolish'

editor.use { -- text objects
  {
    'kana/vim-textobj-user',
    ptp = 'viml',
  },
  {
    'kana/vim-textobj-entire',
    ptp = 'viml',
  },
  {
    'glts/vim-textobj-comment',
    ptp = 'viml',
    event = { 'BufRead', 'BufNewFile' },
    setup = true,
  },
  {
    'wellle/targets.vim',
    ptp = 'viml',
  },
  {
    'chaoren/vim-wordmotion',
    ptp = 'viml',
    event = 'VimEnter',
    setup = true,
  },
}

editor.use { -- Surround
  {
    'tpope/vim-surround',
    ptp = 'viml',
    event = { 'BufRead', 'BufNewFile' },
  },
  {
    'tpope/vim-repeat',
    ptp = 'viml',
    fn = 'repeat#set',
  },
}

editor.use { -- unimpaired
  'tpope/vim-unimpaired',
  config = true,
}

editor.use { -- splitjoin
  'AndrewRadev/splitjoin.vim',
  ptp = 'viml',
  setup = true,
}

editor.use {
  'osyo-manga/vim-jplus',
  disable = true,
  config = function()
    vim.keymap.set({ 'n', 'v' }, 'J', '<plug>(jplus)')
    vim.keymap.set({ 'n', 'v' }, '<leader>J', '<plug>(jplus-getchar)')
  end,
}

editor.use { -- switch
  'AndrewRadev/switch.vim',
  ptp = 'viml',
  keys = '<Plug>(Switch)',
  setup = true,
}

editor.use { -- comment
  'numToStr/Comment.nvim',
  config = true,
}

editor.use { -- niceblock
  'kana/vim-niceblock',
  ptp = 'viml',
  event = 'VimEnter',
  setup = true,
}

editor.use { -- close buffer with save prompt
  'mhinz/vim-sayonara',
  ptp = 'viml',
  cmd = 'Sayonara',
  setup = true,
}

editor.use { -- speedy jk
  'rhysd/accelerated-jk',
  ptp = 'viml',
  event = 'VimEnter',
  setup = true,
}

editor.use { -- lightspeed
  'ggandor/lightspeed.nvim',
}

-- search highlight
editor.use 'romainl/vim-cool'

editor.use { -- indent hint
  'lukas-reineke/indent-blankline.nvim',
  config = true,
}

-- unix commands
editor.use 'tpope/vim-eunuch'

-- Vim
editor.use 'tpope/vim-scriptease'
editor.use { 'tweekmonster/helpful.vim', cmd = 'HelpfulVersion' }
editor.use 'bfredl/nvim-luadev'

editor.use {
  'dstein64/vim-startuptime',
  cmd = 'StartupTime',
  config = [[vim.g.startuptime_tries = 10]],
}

editor.use {
  'ahmedkhalf/project.nvim',
  config = true,
}

editor.use { -- Neorg
  { -- Core
    -- IMPORTANT: run `CC=$(which clang) nvim -c "TSInstallSync norg"` with clang with C++14 support
    'nvim-neorg/neorg',
    requires = 'nvim-lua/plenary.nvim',
    ft = 'norg',
    cmd = { 'NeorgStart', 'Neorg' },
    keys = '<Leader>o',
    wants = { 'neorg-telescope' },
    setup = true,
    config = true,
  },
  { -- Telescope integration
    'nvim-neorg/neorg-telescope',
    after = { 'neorg', 'telescope.nvim' },
  },
}

editor.use { -- Swap function arguments, list elements, function parameters, and more
  'mizlan/iswap.nvim',
  requires = 'nvim-treesitter',
  wants = 'nvim-treesitter',
  cmd = { 'ISwap', 'ISwapWith' },
  setup = true,
  config = true,
}

editor.use { -- Create custom submodes and menus
  'anuvyklack/hydra.nvim',
  config = true,
}

editor.use { -- Smart, directional Neovim split resizing and navigation
  'mrjones2014/smart-splits.nvim',
  module = 'smart-splits',
  config = true,
}

editor.use { -- Highlight and search for todo comments
  'folke/todo-comments.nvim',
  requires = 'nvim-lua/plenary.nvim',
  event = { 'BufRead', 'BufNewFile' },
  setup = true,
  config = true,
}

editor.use { -- Peek lines during command `:{number}` in a non-obtrusive way
  'nacro90/numb.nvim',
  config = true,
  event = 'CmdlineEnter',
}

editor.use { -- Draw text diagrams
  'jbyuki/venn.nvim',
  wants = 'hydra.nvim',
}

editor.use { -- nvimrc
  'windwp/nvim-projectconfig',
  config = true,
}

editor.use {
  'matze/vim-move',
  ptp = 'viml',
  event = 'VimEnter',
  setup = true,
}

editor.use {
  'ibhagwan/smartyank.nvim',
  config = true,
  event = 'CursorHold',
}

return editor
