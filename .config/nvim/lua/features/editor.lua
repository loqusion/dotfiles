local editor = require('crows.utils').new_feat()

local function set_filetype()
  vim.cmd [[filetype on]]
  vim.cmd [[filetype plugin on]]
  vim.g.do_filetype_lua = 1
  -- vim.g.did_load_filetypes = 1
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
  vim.opt.listchars = {
    tab = ' ──',
    space = '⋅',
    nbsp = '␣',
    trail = '•',
    eol = '↵',
    precedes = '«',
    extends = '»',
  }

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
  {
    'glts/vim-textobj-comment',
    config = function()
      vim.g.textobj_comment_no_default_key_mappings = 1
      require('crows').key.maps({
        ['ac'] = { '<Plug>(textobj-comment-a)', 'a comment' },
        ['ic'] = { '<Plug>(textobj-comment-i)', 'in comment' },
      }, { mode = 'o' })
    end,
  },
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
      if vim.fn.maparg('<s', 'n', false, false) ~= '' then
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
    end

    if vim.v.vim_did_enter == 1 then
      _unmap_unimpaired()
    else
      vim.cmd [[autocmd VimEnter * ++once lua _unmap_unimpaired()]]
    end

    local defaults = {
      conceallevel = vim.go.conceallevel ~= 0 and vim.go.conceallevel or 2,
      laststatus = vim.go.laststatus ~= 0 and vim.go.laststatus or 3,
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
          ':<C-U>set conceallevel=<C-R>=&conceallevel == 0 ? ' .. defaults.conceallevel .. ' : 0<CR><CR>',
          'Toggle conceallevel',
        },
        g = {
          ':<C-U>set laststatus=<C-R>=&laststatus == 0 ? ' .. defaults.laststatus .. ' : 0<CR><CR>',
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
  setup = function()
    require('crows').key.map('Sayonara', 'n', 'q', '<cmd>Sayonara<cr>')
  end,
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
    require('crows').key.map('Toggle symbols outline', 'n', '<localleader>o', '<cmd>SymbolsOutline<cr>')
  end,
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
      },
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

return editor
