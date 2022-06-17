local syntax = require('crows.utils').new_feat()

-- better matching
syntax.use {
  'andymass/vim-matchup',
  config = function()
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_deferred_show_delay = 100
    vim.g.matchup_matchparen_hi_surround_always = 1
    vim.g.matchup_surround_enabled = 1
  end,
}

-- color highlighter
syntax.use {
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
syntax.use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  requires = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
    },
    'JoosepAlviste/nvim-ts-context-commentstring',
    {
      'David-Kunz/treesitter-unit',
      config = function()
        require('crows').key.map('Select treesitter unit', 'x', 'iu', ':lua require("treesitter-unit").select()<CR>')
        require('crows').key.map(
          'Select treesitter unit',
          'x',
          'au',
          ':lua require("treesitter-unit").select(true)<CR>'
        )
        require('crows').key.map(
          'Select treesitter unit',
          'o',
          'iu',
          ':<C-u>lua require("treesitter-unit").select()<CR>'
        )
        require('crows').key.map(
          'Select treesitter unit',
          'o',
          'au',
          ':<C-u>lua require("treesitter-unit").select(true)<CR>'
        )
      end,
    },
    {
      'windwp/nvim-ts-autotag',
      after = 'nvim-treesitter',
      ft = { 'html', 'javascriptreact', 'typescriptreact', 'vue', 'markdown' },
    },
    {
      'RRethy/nvim-treesitter-endwise',
      ft = { 'lua', 'ruby', 'sh', 'vim' },
    },
    {
      'nvim-treesitter/playground',
      after = 'nvim-treesitter',
      cmd = 'TSPlaygroundToggle',
    },
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = 'all',
      ignore_install = { 'php', 'phpdoc' },
      additional_vim_regex_highlighting = false,
      highlight = {
        enable = true,
        disable = {
          'vim',
          'help',
          'c',
        },
      },
      indent = {
        -- Enabling this removes the leading space from /*...*...*/ comments! This is annoying!!
        enable = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          scope_incremental = 'gna',
          node_incremental = 'grn',
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
      autotag = { enable = true },
      context_commentstring = {
        -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
        enable = true,
        enable_autocmd = false,
      },
      endwise = { enable = true },
      matchup = { enable = true },
    }

    -- Enable syntax for non treesitter highlights
    -- vim.cmd [[
    --   autocmd MyAutoCmd FileType c,help,gitcommit
    --   \ if &l:syntax == '' | syntax enable | endif
    -- ]]
  end,
}

syntax.use 'nvim-treesitter/nvim-treesitter-context'

syntax.use 'MTDL9/vim-log-highlighting'

return syntax
