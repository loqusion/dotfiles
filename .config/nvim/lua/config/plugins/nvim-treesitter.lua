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
      enable = true,
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
    autotag = {
      enable = true,
      filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'markdown' },
    },
    context_commentstring = {
      -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
      enable = true,
      enable_autocmd = false,
    },
    endwise = { enable = true },
    matchup = { enable = true },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { 'BufWrite', 'CursorHold' },
    },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['il'] = '@loop.inner',
          ['al'] = '@loop.outer',
          ['icd'] = '@conditional.inner',
          ['acd'] = '@conditional.outer',
          ['acm'] = '@comment.outer',
          ['ast'] = '@statement.outer',
          ['isc'] = '@scopename.inner',
          ['iB'] = '@block.inner',
          ['aB'] = '@block.outer',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ['gnf'] = '@function.outer',
          ['gnif'] = '@function.inner',
          ['gna'] = '@parameter.inner',
          ['gnc'] = '@call.outer',
          ['gnic'] = '@call.inner',
        },
        goto_next_end = {
          ['gnF'] = '@function.outer',
          ['gniF'] = '@function.inner',
          ['gnA'] = '@parameter.inner',
          ['gnC'] = '@call.outer',
          ['gniC'] = '@call.inner',
        },
        goto_previous_start = {
          ['gpf'] = '@function.outer',
          ['gpif'] = '@function.inner',
          ['gpa'] = '@parameter.inner',
          ['gpc'] = '@call.outer',
          ['gpic'] = '@call.inner',
        },
        goto_previous_end = {
          ['gpF'] = '@function.outer',
          ['gpiF'] = '@function.inner',
          ['gpA'] = '@parameter.inner',
          ['gpC'] = '@call.outer',
          ['gpiC'] = '@call.inner',
        },
      },
    },
    textsubjects = {
      enable = true,
      keymaps = {
        ['.'] = 'textsubjects-smart',
      },
    },
  }
end

function M.register_global_keys()
  local key = require('crows').key
  key.map('Select treesitter unit', 'x', 'iu', ':lua require("treesitter-unit").select()<CR>')
  key.map('Select treesitter unit', 'x', 'au', ':lua require("treesitter-unit").select(true)<CR>')
  key.map('Select treesitter unit', 'o', 'iu', ':<C-u>lua require("treesitter-unit").select()<CR>')
  key.map('Select treesitter unit', 'o', 'au', ':<C-u>lua require("treesitter-unit").select(true)<CR>')
end

return M
