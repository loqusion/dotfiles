-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
-- https://github.com/David-Kunz/treesitter-unit
-- https://github.com/windwp/nvim-ts-autotag
-- https://github.com/RRethy/nvim-treesitter-endwise
-- https://github.com/nvim-treesitter/playground
-- https://github.com/nvim-treesitter/nvim-treesitter-context

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config()
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
end

function M.register_global_keys()
  local key = require('crows').key
  key.map('Select treesitter unit', 'x', 'iu', ':lua require("treesitter-unit").select()<CR>')
  key.map('Select treesitter unit', 'x', 'au', ':lua require("treesitter-unit").select(true)<CR>')
  key.map('Select treesitter unit', 'o', 'iu', ':<C-u>lua require("treesitter-unit").select()<CR>')
  key.map('Select treesitter unit', 'o', 'au', ':<C-u>lua require("treesitter-unit").select(true)<CR>')
end

return M
