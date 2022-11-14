-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
-- https://github.com/David-Kunz/treesitter-unit
-- https://github.com/windwp/nvim-ts-autotag
-- https://github.com/RRethy/nvim-treesitter-endwise
-- https://github.com/nvim-treesitter/playground
-- https://github.com/nvim-treesitter/nvim-treesitter-context

local M = {
  safe_requires = {
    { 'nvim-treesitter.configs', 'treesitter_configs' },
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  M.treesitter_configs.setup {
    ensure_installed = 'all',
    ignore_install = { 'php', 'phpdoc' },
    additional_vim_regex_highlighting = false,
    highlight = {
      enable = true,
      disable = {
        'vim',
        'help',
      },
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = false,
      keymaps = {
        init_selection = 'gnn',
        scope_incremental = 'gna',
        node_incremental = 'grn',
        node_decremental = 'grm',
      },
    },
    autotag = {
      enable = true,
      -- filetypes = { 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'markdown' },
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
    tree_setter = {
      enable = false,
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
          -- ['icd'] = '@conditional.inner',
          -- ['acd'] = '@conditional.outer',
          -- ['acm'] = '@comment.outer',
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
          [']m'] = '@function.outer',
          [']im'] = '@function.inner',
          [')'] = '@parameter.inner',
          -- [']c'] = '@call.outer',
          -- [']ic'] = '@call.inner',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']iM'] = '@function.inner',
          ['g)'] = '@parameter.inner',
          -- [']C'] = '@call.outer',
          -- [']iC'] = '@call.inner',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[im'] = '@function.inner',
          ['('] = '@parameter.inner',
          -- ['[c'] = '@call.outer',
          -- ['[ic'] = '@call.inner',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[iM'] = '@function.inner',
          ['g('] = '@parameter.inner',
          -- ['[C'] = '@call.outer',
          -- ['[iC'] = '@call.inner',
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
