local editor = require('crows.utils').new_feat()

local function set_filetype()
  vim.cmd [[filetype on]]
  vim.cmd [[filetype plugin on]]
  vim.g.do_filetype_lua = 1
  -- vim.g.did_load_filetypes = 1
  vim.g.did_load_filetypes = 0
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
  vim.opt.foldmethod = 'indent'
  vim.opt.foldlevelstart = 99
  vim.opt.signcolumn = 'yes:1'
  vim.opt.wildignorecase = true
  vim.opt.wildignore:append {
    '*/.yarn/*',
    '*/.git/*',
    '*/node_modules/*',
    '*.swp',
    '*.pyc',
    '*/venv/*',
    '*/target/*',
    '.DS_Store',
  }
  vim.opt.lazyredraw = true
  vim.opt.redrawtime = 0
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.virtualedit = 'block'
  vim.opt.diffopt = { 'internal', 'algorithm:patience', 'indent-heuristic' }
  vim.opt.fileformat = 'unix'
  vim.opt.fileformats = { 'unix', 'dos', 'mac' }
  vim.opt.formatoptions:remove { 't' }
  vim.opt.formatoptions:append {
    -- Auto-wrap comments
    c = true,
    -- Continue comments after <CR>
    r = true,
    -- Allow formatting comments with `gq`
    q = true,
    -- Long lines are not broken in insert mode
    l = true,
    -- Remove comment leader when joining lines
    j = true,
  }
  vim.opt.list = true
  if vim.fn.has 'win32' ~= 0 then
    vim.o.listchars = 'tab:>-,trail:-,precedes:<'
  else
    vim.opt.listchars = {
      space = '⋅',
      tab = '→ ',
      -- eol = '↴',
      precedes = '«',
      extends = '»',
      nbsp = '%',
    }
  end

  set_filetype()

  -- setup indent
  vim.cmd [[filetype indent on]]
  vim.opt.cindent = true
  vim.opt.smartindent = true
  vim.opt.autoindent = true
  vim.opt.expandtab = true
  vim.opt.shiftround = true
  vim.opt.tabstop = 8
  vim.opt.shiftwidth = 4
  vim.opt.softtabstop = 0
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
  config = function()
    vim.fn['arpeggio#map']('i', '', 0, 'jk', '<Esc>')
    vim.g.arpeggio_timeoutlen = 60
  end,
}

-- sleuth
editor.use 'tpope/vim-sleuth'

-- text objects
editor.use {
  'kana/vim-textobj-user',
  'kana/vim-textobj-entire',
  'wellle/targets.vim',
  {
    'chaoren/vim-wordmotion',
    config = function()
      vim.g.wordmotion_mappings = {
        aw = 'av',
        iw = 'iv',
      }
    end,
  },
}

-- surround
editor.use {
  {
    'tpope/vim-surround',
  },
  'tpope/vim-repeat',
}

-- unimpaired
editor.use {
  'tpope/vim-unimpaired',
  config = function()
    function _G._unmap_unimpaired()
      local unmap = vim.keymap.del
      unmap('n', '<s')
      unmap('n', '<s<Esc>')
      unmap('n', '<p')
      unmap('n', '<P')
      unmap('n', '>s')
      unmap('n', '>s<Esc>')
      unmap('n', '>p')
      unmap('n', '>P')
    end

    if vim.v.vim_did_enter == 1 then
      _unmap_unimpaired()
    else
      vim.cmd [[autocmd VimEnter * ++once lua _unmap_unimpaired()]]
    end

    local defaults = {
      conceallevel = vim.go.conceallevel ~= 0 and vim.go.conceallevel or 2,
      laststatus = vim.go.laststatus ~= 0 and vim.go.laststatus or 3
    }
    require('crows').key.maps({
      ['<Plug>(unimpaired-enable)'] = {
        a = { ':<C-U>set conceallevel=' .. defaults.conceallevel .. '<CR>', 'Enable conceallevel' },
        g = { ':<C-U>set laststatus=' .. defaults.laststatus .. '<CR>', 'Enable laststatus' },
      },
      ['<Plug>(unimpaired-disable)'] = {
        a = { ':<C-U>set conceallevel=0' .. '<CR>', 'Disable conceallevel' },
        g = { ':<C-U>set laststatus=0' .. '<CR>', 'Disable laststatus' },
      },
      ['<Plug>(unimpaired-toggle)'] = {
        a = {
          ':<C-U>set conceallevel=<C-R>=&conceallevel == 0 ? '
              .. defaults.conceallevel
              .. ' : 0<CR><CR>',
          'Toggle conceallevel',
        },
        g = {
          ':<C-U>set laststatus=<C-R>=&laststatus == 0 ? '
              .. defaults.laststatus
              .. ' : 0<CR><CR>',
          'Toggle laststatus',
        },
      },
    }, { silent = false })
  end,
}

-- splitjoin
editor.use {
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_split_mapping = ''
    vim.g.splitjoin_join_mapping = ''
    require('crows').key.maps({
      ['<Leader>'] = {
        j = { '<cmd>SplitjoinSplit<cr>', 'Split line' },
        k = { '<cmd>SplitjoinJoin<cr>', 'Join line' },
      },
    }, { silent = true })
  end,
}

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
editor.use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
}

-- autopairs
editor.use {
  'windwp/nvim-autopairs',
  requires = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {
      fast_wrap = {},
      enable_check_bracket_line = true,
      check_ts = true,
    }
    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
  end,
}

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
editor.use {
  'mhinz/vim-sayonara',
  cmd = 'Sayonara',
}

-- speedy jk
editor.use {
  'rhysd/accelerated-jk',
  config = function()
    vim.keymap.set('n', 'j', '<Plug>(accelerated_jk_gj)', { silent = true })
    vim.keymap.set('n', 'k', '<Plug>(accelerated_jk_gk)', { silent = true })
  end,
}

-- visual f/t
editor.use {
  'hrsh7th/vim-eft',
  disable = true,
  config = function()
    local keymap = vim.keymap

    vim.g.eft_ignorecase = 1

    keymap.set('n', ';', '<plug>(eft-repeat)')
    keymap.set('x', ';', '<plug>(eft-repeat)')

    keymap.set('n', 'f', '<plug>(eft-f)')
    keymap.set('x', 'f', '<plug>(eft-f)')
    keymap.set('o', 'f', '<plug>(eft-f)')

    -- reserved for fuzzy motion
    -- keymap.set('n', 'F', '<plug>(eft-F)')
    keymap.set('x', 'F', '<plug>(eft-F)')
    keymap.set('o', 'F', '<plug>(eft-F)')
  end,
}

-- lightspeed
editor.use {
  'ggandor/lightspeed.nvim',
}

-- show registers
editor.use {
  'tversteeg/registers.nvim',
  disable = true,
  keys = { { 'n', '"' }, { 'i', '<c-r>' } },
  config = function()
    vim.g.registers_paste_in_normal_mode = 1
    vim.g.registers_hide_only_whitespace = 1
    vim.g.registers_show_empty_registers = 0
  end,
}

-- undotree
editor.use {
  'mbbill/undotree',
  cmd = 'UndotreeToggle',
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}

-- symbols outline
editor.use {
  'simrat39/symbols-outline.nvim',
  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
  setup = function()
    require('crows').key.map(
      'Toggle symbols outline',
      'n',
      '<localleader>o',
      '<cmd>SymbolsOutline<cr>'
    )
  end,
}

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

-- better matching
editor.use {
  'andymass/vim-matchup',
  config = function()
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_deferred_show_delay = 100
    vim.g.matchup_matchparen_hi_surround_always = 1
    vim.g.matchup_surround_enabled = 1
  end,
}

-- search highlight
editor.use 'romainl/vim-cool'

-- color highlighter
editor.use {
  'norcalli/nvim-colorizer.lua',
  ft = {
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'sass',
    'scss',
    'typescript',
    'typescriptreact',
    'vim',
    'vue',
  },
  config = function()
    require('colorizer').setup({
      'css',
      'html',
      'javascript',
      'javascriptreact',
      'sass',
      'scss',
      'typescript',
      'typescriptreact',
      'vim',
      'vue',
    }, {
      RGB = true,
      RRGGBB = true,
      names = true,
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
    })
  end,
}

-- treesitter
editor.use {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'all',
        ignore_install = { 'php', 'phpdoc' },
        additional_vim_regex_highlighting = false,
        highlight = {
          enable = true,
          disable = { 'help' },
        },
        indent = {
          -- Enabling this removes the leading space from /*...*...*/ comments! This is annoying!!
          enable = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['aC'] = '@class.outer',
              ['iC'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },
        endwise = { enable = true },
        autotag = { enable = true },
        matchup = { enable = true },
      }

      -- Enable syntax for non treesitter highlights
      -- vim.cmd [[
      --   autocmd MyAutoCmd FileType c,help,gitcommit
      --   \ if &l:syntax == '' | syntax enable | endif
      -- ]]
    end,
  },
  {
    'nvim-treesitter/playground',
    cmd = 'TSPlaygroundToggle',
    after = 'nvim-treesitter',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },
  {
    'RRethy/nvim-treesitter-endwise',
    ft = { 'lua', 'ruby', 'sh', 'vim' },
    after = 'nvim-treesitter',
  },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'javascriptreact', 'typescriptreact', 'vue', 'markdown' },
    after = 'nvim-treesitter',
  },
}

-- git management
editor.use 'tpope/vim-fugitive'
editor.use 'tpope/vim-rhubarb'
editor.use {
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup {
      on_attach = function(_)
        local gs = package.loaded.gitsigns
        local key = require('crows').key

        local function next_hunk()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end

        local function prev_hunk()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end

        local function blame_line_full()
          gs.blame_line { full = true }
        end

        local function diffthis()
          gs.diffthis '~'
        end

        key.maps {
          [']c'] = { next_hunk, 'Goto next hunk' },
          ['[c'] = { prev_hunk, 'Goto prev hunk' },
          ['<leader>g'] = {
            name = 'Gitsigns',
            S = { gs.stage_buffer, 'Stage current buffer' },
            u = { gs.undo_stage_hunk, 'Undo last staged hunk' },
            R = { gs.reset_buffer, 'Reset current buffer' },
            p = { gs.preview_hunk, 'Preview hunk' },
            b = { blame_line_full, 'Blame current line' },
            tb = { gs.toggle_current_line_blame, 'Toggle blame current line' },
            d = { gs.diffthis, 'Git diff' },
            D = { diffthis, 'Git diff' },
            td = { gs.toggle_deleted, 'Toggle deleted' },
          },
        }
        for _, mode in ipairs { 'n', 'v' } do
          key.map('Stage hunk', mode, '<leader>gs', ':Gitsigns stage_hunk<cr>')
          key.map('Reset hunk', mode, '<leader>gr', ':Gitsigns reset_hunk<cr>')
        end
        for _, mode in ipairs { 'o', 'x' } do
          key.map('hunk', mode, 'ic', '<cmd>Gitsigns select_hunk<cr>')
          key.map('hunk', mode, 'ac', '<cmd>Gitsigns select_hunk<cr>')
        end
      end,
    }
  end,
}
editor.use {
  'TimUntersberger/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  cmd = 'Neogit',
  config = function()
    require('neogit').setup {
      integrations = { diffview = true },
      disable_commit_confirmation = true,
      disable_signs = true,
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
      }
    }
    vim.cmd [[autocmd MyAutoCmd FileType vimwiki setlocal nolist concealcursor=]]
  end,
}
editor.use {
  'Shougo/vinarise.vim',
  disable = true,
  cmd = 'Vinarise',
  setup = [[vim.g.vinarise_enable_auto_detect = 1]],
}

editor.use {
  'dstein64/vim-startuptime',
  cmd = 'StartupTime',
  config = [[vim.g.startuptime_tries = 10]],
}

editor.use 'antoinemadec/FixCursorHold.nvim'

-- editor.use 'MunifTanjim/nui.nvim'

-- editor.use 'vim-jp/vimdoc-ja'

editor.post = function()
  ----------------------------------------------------------------------------
  -- Autocommands
  vim.cmd [[
    augroup MyAutoCmd
      autocmd!

      " For only Vim help files.
      autocmd BufRead,BufWritePost *.txt
            \ setlocal modelines=2 modeline colorcolumn= foldcolumn=0 signcolumn=no

      " Disable unnecessary features in man pages.
      autocmd FileType man setlocal signcolumn=no

      " Disable paste.
      autocmd InsertLeave *
            \ if &paste | setlocal nopaste | setlocal paste? | endif |
            \ if &l:diff | diffupdate | endif

      " hl-QuickFixLine doesn't play nicely with listchars.
      autocmd FileType qf setlocal nolist

      " Make directory automatically.
      " --------------------------------------
      " http://vim-users.jp/2011/02/hack202/
      autocmd MyAutoCmd BufWritePre *
            \ call MkdirAsNecessary(expand('<afile>:p:h'), v:cmdbang)
      function! MkdirAsNecessary(dir, force) abort
        if !isdirectory(a:dir) && &l:buftype ==# '' &&
              \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
              \              a:dir)) =~? '^y\%[es]$')
          call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
      endfunction

      " Trim unnecessary whitespace.
      autocmd MyAutoCmd BufWritePre *
            \ call vimrc#trim_trailing_whitespace() |
            \ call vimrc#trim_final_newlines()
    augroup END

    " Reload plugins file on save.
    let $CONFIG = stdpath('config')
    let $PLUGINS_SPEC = $CONFIG .. '/lua/plugins.lua'
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost $PLUGINS_SPEC,$CONFIG/lua/config/*
            \ exec 'source ' .. $PLUGINS_SPEC |
            \ packadd packer.nvim | lua require('plugins').compile()
    augroup end
  ]]

  ----------------------------------------------------------------------------
  -- Commands
  vim.cmd [[command! Todo Grepper -noprompt -tool git -query -E '(TODO|FIXME|BUG|XXX):']]
  vim.cmd [[
    command! -bang -bar -addr=other -complete=customlist,man#complete -nargs=* VMan
          \ exe 'vertical <mods> <count>Man <args>'
  ]]

  ----------------------------------------------------------------------------
  -- Keybindings
  local map = vim.keymap.set

  -- Release keymappings for plugins.
  map('n', 'm', '<Nop>')
  map('n', ',', '<Nop>')

  map({ 'n', 'x' }, '<Space>', '<Nop>', { remap = true })

  -- map({ 'n', 'x' }, 's', '<nop>')
  -- map({ 'n', 'x' }, 'S', '<nop>')

  -- Easy indent
  map('n', '>', '>>')
  map('n', '<', '<<')
  map('x', '>', '>gv')
  map('x', '<', '<gv')

  -- Insert mode keymappings:
  -- Enable undo <C-w> and <C-u>.
  map('i', '<C-w>', '<C-g>u<C-w>')
  map('i', '<C-u>', '<C-g>u<C-u>')
  --map('i', '<C-k>', '<C-o>D')

  -- Command mode keymappings:
  -- <C-b>: previous char.
  map('c', '<C-b>', '<Left>')
  -- <C-f>: next char.
  map('c', '<C-f>', '<Right>')
  -- <M-b>: previous word.
  map('c', '<M-b>', '<S-Left>')
  -- <M-f>: next word.
  map('c', '<M-f>', '<S-Right>')
  -- <C-a> move to head.
  map('c', '<C-a>', '<Home>')
  -- <C-e> move to end.
  map('c', '<C-e>', '<End>')
  -- <C-p>: previous history.
  map('c', '<C-p>', '<Up>')
  -- <C-n>: next history.
  map('c', '<C-n>', '<Down>')
  -- <C-y>: paste.
  map('c', '<C-y>', '<C-r>*')
  -- <C-g>: Exit.
  map('c', '<C-g>', '<C-c>')
  -- <C-d>: delete char.
  map('c', '<C-d>', '<Del>')
  -- <C-k>: Delete to the end.
  map('c', '<C-k>', [[repeat("\<Del>", strchars(getcmdline()[getcmdpos() - 1:]))]], { expr = true })

  map('n', '<Space>l', [[<cmd>call vimrc#toggle_option('laststatus')<cr>]])

  -- Quickfix
  map('n', '<Space>e', vim.diagnostic.open_float)
  map('n', '[d', vim.diagnostic.goto_prev)
  map('n', ']d', vim.diagnostic.goto_next)
  map('n', '<Space>q', vim.diagnostic.setloclist)

  -- Useful save/quit mappings.
  map('n', '<leader><leader>', '<cmd>silent update<cr>', { silent = true })
  map('n', '<leader>q', '<cmd>qa<cr>', { silent = true })
  map('n', '<leader>X', '<cmd>x!<cr>', { silent = true })
  map('n', '<leader>D', '<cmd>Sayonara<cr>', { silent = true })

  -- Window movement
  map('n', '<c-h>', '<c-w>h')
  map('n', '<c-j>', '<c-w>j')
  map('n', '<c-k>', '<c-w>k')
  map('n', '<c-l>', '<c-w>l')

  -- Better x
  map('n', 'x', '"_x')
  map('n', 'X', '"_X')

  -- Disable ex-mode.
  map({ 'n', 'x' }, 'q', '<Nop>')
  map('n', 'Q', 'q')

  -- Useless commands.
  map({ 'n', 'i', 'c', 'v', 'o', 't', 'l' }, '<MiddleMouse>', '<Nop>')
  map('n', 'M', 'm')
  map('n', 'gs', '<nop>')

  -- Smart <C-f>, <C-b>.
  map(
    'n',
    '<C-f>',
    [[max([winheight(0) - 2, 1]) .. '<C-e>' .. (line('w$') >= line('$') ? 'L' : 'M')]],
    { expr = true }
  )
  map(
    'n',
    '<C-b>',
    [[max([winheight(0) - 2, 1]) .. '<C-y>' .. (line('w0') <= 1 ? 'H' : 'M')]],
    { expr = true }
  )

  -- Disable ZZ.
  map('n', 'ZZ', '<nop>')

  -- Redraw.
  map('n', '<C-S-l>', '<cmd>redraw!<cr>', { silent = true })

  -- If press l on fold, fold open.
  map('n', 'l', [[foldclosed(line('.')) != -1 ? 'zo0' : 'l']], { expr = true })
  -- If press l on fold, range fold open.
  map('x', 'l', [[foldclosed(line('.')) != -1 ? 'zogv0' : 'l']], { expr = true })

  -- Switch between alternate buffer.
  map('n', '#', '<C-^>', { silent = true })

  -- {visual}p to put without yank to unnamed register
  map('x', 'p', 'P')

  -- Begin a new line without leaving insert mode.
  map('i', '<C-CR>', '<C-o>o')
  map('i', '<S-CR>', '<C-o>O')

  -- Suppress "Type :qa and press <Enter> to exit Nvim"
  map('n', '<C-c>', '<silent> <C-c>')
end

return editor
