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
  'tpope/vim-surround',
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
-- editor.use 'tpope/vim-commentary'
editor.use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      pre_hook = function(ctx)
        -- Only calculate commentstring for jsx/tsx filetypes
        if vim.bo.filetype == 'javascriptreact' or vim.bo.filetype == 'typescriptreact' then
          local U = require 'Comment.utils'

          -- Determine whether to use linewise or blockwise commentstring
          local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

          -- Determine the location where to calculate commentstring from
          local location = nil
          if ctx.ctype == U.ctype.block then
            location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
          end

          return require('ts_context_commentstring.internal').calculate_commentstring {
            key = type,
            location = location,
          }
        end
        -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
        -- require('Comment').setup {
        --   pre_hook = function(ctx)
        --     local U = require 'Comment.utils'
        --
        --     local location = nil
        --     if ctx.ctype == U.ctype.block then
        --       location = require('ts_context_commentstring.utils').get_cursor_location()
        --     elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        --       location = require('ts_context_commentstring.utils').get_visual_start_location()
        --     end
        --
        --     return require('ts_context_commentstring.internal').calculate_commentstring {
        --       key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
        --       location = location,
        --     }
        --   end,
        -- }
      end,
    }
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
