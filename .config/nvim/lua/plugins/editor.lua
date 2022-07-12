local editor = require('crows.utils').new_feat()

local function set_filetype()
  vim.cmd [[filetype on]]
  vim.cmd [[filetype plugin on]]
  local filetypes = {
    ['*html'] = 'html',
    ['tsconfig.json'] = 'jsonc',
  }
  local ft_group = vim.api.nvim_create_augroup('filetypes', {})
  for pattern, filetype in pairs(filetypes) do
    vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
      group = ft_group,
      pattern = pattern,
      command = 'setfiletype ' .. filetype,
      once = true,
    })
  end
end

editor.pre = function()
  -- vim.cmd [[syntax enable]]
  -- set_filetype()
  -- vim.cmd [[filetype indent on]]
end

editor.use { -- arpeggio
  'kana/vim-arpeggio',
  ptp = 'viml',
  event = 'InsertEnter',
  setup = true,
}

-- sleuth
editor.use 'tpope/vim-sleuth'

editor.use 'tpope/vim-abolish'

-- text objects
editor.use {
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

-- unimpaired
editor.use {
  'tpope/vim-unimpaired',
  config = true,
}

-- splitjoin
editor.use {
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

-- switch
editor.use {
  'AndrewRadev/switch.vim',
  keys = '<Plug>(Switch)',
  setup = true,
}

-- comment
editor.use {
  'numToStr/Comment.nvim',
  config = true,
}

-- niceblock
editor.use {
  'kana/vim-niceblock',
  ptp = 'viml',
  event = 'VimEnter',
  setup = true,
}

-- close buffer with save prompt
editor.use {
  'mhinz/vim-sayonara',
  ptp = 'viml',
  cmd = 'Sayonara',
  setup = true,
}

-- speedy jk
editor.use {
  'rhysd/accelerated-jk',
  config = true,
}

-- lightspeed
editor.use {
  'ggandor/lightspeed.nvim',
}

-- search highlight
editor.use 'romainl/vim-cool'

-- indent hint
editor.use { 'lukas-reineke/indent-blankline.nvim', config = true }

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

editor.use {
  'anuvyklack/hydra.nvim',
  config = true,
}

return editor
