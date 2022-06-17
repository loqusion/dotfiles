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
editor.use 'kana/vim-arpeggio'

-- sleuth
editor.use 'tpope/vim-sleuth'

-- text objects
editor.use {
  'kana/vim-textobj-user',
  'kana/vim-textobj-entire',
  'glts/vim-textobj-comment',
  'wellle/targets.vim',
  'chaoren/vim-wordmotion',
}

-- surround
editor.use {
  'tpope/vim-surround',
  'tpope/vim-repeat',
}

-- unimpaired
editor.use 'tpope/vim-unimpaired'

-- splitjoin
editor.use 'AndrewRadev/splitjoin.vim'

editor.use {
  'osyo-manga/vim-jplus',
  disable = true,
  config = function()
    local map = vim.keymap.set
    map({ 'n', 'v' }, 'J', '<plug>(jplus)')
    map({ 'n', 'v' }, '<leader>J', '<plug>(jplus-getchar)')
  end,
}

-- switch
editor.use {
  'AndrewRadev/switch.vim',
  keys = '_',
  setup = function()
    vim.g.switch_mapping = '_'
  end,
}

-- comment
editor.use 'numToStr/Comment.nvim'

-- niceblock
editor.use {
  'kana/vim-niceblock',
  config = function()
    require('crows').key.maps({
      I = { '<Plug>(niceblock-I)', 'Prepend visual selection' },
      A = { '<Plug>(niceblock-A)', 'Append visual selection' },
    }, { mode = 'x' })
  end,
}

-- close buffer with save prompt
editor.use { 'mhinz/vim-sayonara', cmd = 'Sayonara' }

-- speedy jk
editor.use {
  'rhysd/accelerated-jk',
  config = function()
    vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', { silent = true })
    vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', { silent = true })
  end,
}

-- lightspeed
editor.use {
  'ggandor/lightspeed.nvim',
}

-- search highlight
editor.use 'romainl/vim-cool'

-- indent hint
editor.use {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      buftype_exclude = { 'help', 'nofile', 'nowrite', 'quickfix', 'terminal', 'prompt' },
      show_current_context = true,
      show_current_context_start = true,
      use_treesitter = true,
    }
  end,
}

-- unix commands
editor.use 'tpope/vim-eunuch'

-- Vim
editor.use 'tpope/vim-scriptease'
editor.use { 'tweekmonster/helpful.vim', cmd = 'HelpfulVersion' }
editor.use 'folke/lua-dev.nvim'

editor.use {
  'vimwiki/vimwiki',
  keys = '<Plug>Vimwiki',
  cmd = 'VimwikiIndex',
  setup = function()
    vim.keymap.set('n', '<leader>ww', '<plug>VimwikiIndex')
    vim.g.vimwiki_list = {
      {
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
      },
    }
    vim.cmd [[autocmd MyAutoCmd FileType vimwiki setlocal nolist concealcursor=]]
  end,
}

editor.use {
  'dstein64/vim-startuptime',
  cmd = 'StartupTime',
  config = [[vim.g.startuptime_tries = 10]],
}

return editor
