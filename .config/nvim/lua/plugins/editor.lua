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
    vim.api.nvim_create_autocmd(
      { 'BufNewFile', 'BufRead' },
      { group = ft_group, pattern = pattern, command = 'setfiletype ' .. filetype, once = true }
    )
  end
end

editor.pre = function()
  vim.cmd [[syntax enable]]
  set_filetype()
  vim.cmd [[filetype indent on]]
  local fi_group = vim.api.nvim_create_augroup('fileindent', {})
  vim.api.nvim_create_autocmd('FileType', {
    group = fi_group,
    pattern = 'lua,javascript,typescript,javascriptreact,typescriptreact,html,css,scss,sass,xml,yaml,json',
    command = 'setlocal expandtab ts=2 sw=2 sts=-1',
  })
end

-- arpeggio
editor.use {
  'kana/vim-arpeggio',
  event = 'InsertEnter',
  ptp = 'viml',
}

-- sleuth
editor.use 'tpope/vim-sleuth'

-- text objects
editor.use {
  'kana/vim-textobj-user',
  'kana/vim-textobj-entire',
  {
    'glts/vim-textobj-comment',
    keys = '<Plug>(textobj-comment',
    ptp = 'viml',
  },
  'wellle/targets.vim',
  {
    'chaoren/vim-wordmotion',
    event = 'VimEnter',
    ptp = 'viml',
  },
}

-- surround
editor.use {
  'tpope/vim-surround',
  'tpope/vim-repeat',
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
  event = 'VimEnter',
  ptp = 'viml',
}

-- close buffer with save prompt
editor.use {
  'mhinz/vim-sayonara',
  cmd = 'Sayonara',
  ptp = 'viml',
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
editor.use 'folke/lua-dev.nvim'
editor.use 'bfredl/nvim-luadev'

editor.use {
  'vimwiki/vimwiki',
  keys = '<Plug>Vimwiki',
  cmd = 'VimwikiIndex',
  ptp = 'viml',
}

editor.use {
  'dstein64/vim-startuptime',
  cmd = 'StartupTime',
  config = [[vim.g.startuptime_tries = 10]],
}

return editor
