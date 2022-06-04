local crows = require 'crows'
local search = require('crows.utils').new_feat()

search.pre = function()
  vim.opt.ignorecase = true
end

search.post = function()
  crows.key.map('Clear search', 'n', '<leader>/', '<cmd>nohlsearch<cr>')
end

search.use 'romainl/vim-qf'
search.use 'Olical/vim-enmasse'

search.use {
  'mhinz/vim-grepper',
  disable = true,
  cmd = 'Grepper',
  keys = '<plug>(GrepperOperator)',
  setup = function()
    vim.cmd [[
      let g:grepper = {}
      let g:grepper.searchreg = 1
      let g:grepper.prompt_text = '$c '
    ]]
    local key = require('crows').key
    for _, mode in ipairs { 'n', 'x' } do
      key.map('Grepper', mode, 'gs', '<Plug>(GrepperOperator)')
    end
  end,
}

-- telescope
search.use {
  -- 'nvim-telescope/telescope.nvim',
  '~/Projects/telescope.nvim', -- Until `find_files` has additional ignore options
  requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim' },
    { 'nvim-telescope/telescope-dap.nvim', after = 'telescope.nvim' },
    -- TODO: auto-session
    -- { 'rmagatti/session-lens' },
  },
  wants = {
    'popup.nvim',
    'plenary.nvim',
    'telescope-frecency.nvim',
    'telescope-fzf-native.nvim',
  },
  cmd = 'Telescope',
  module = 'telescope',
  config = function()
    local telescope = require 'telescope'
    telescope.load_extension 'frecency'
    telescope.load_extension 'fzf'
    telescope.load_extension 'ui-select'
    telescope.load_extension 'dap'

    telescope.setup {
      defaults = {
        layout_strategy = 'flex',
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<C-v>'] = false,
            ['<C-CR>'] = require('telescope.actions').select_vertical,
            ['<S-CR>'] = require('telescope.actions').select_horizontal,
          },
        },
      },
      extensions = {
        frecency = {
          workspaces = {
            clientele = '/Users/rasnauf/Projects/clientele',
          },
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {},
        },
      },
    }
  end,
  setup = function()
    local lazy_require = require('crows.utils').lazy_require
    local tb = 'telescope.builtin'

    require('crows').key.maps {
      ['<leader>'] = {
        name = 'telescope search',
        s = {
          f = { lazy_require(tb, 'find_files', { hidden = true }), 'Find files' },
          v = {
            lazy_require(tb, 'find_files', { cwd = vim.fn.stdpath 'config' }),
            'Find in Vim config',
          },
          b = { lazy_require(tb, 'current_buffer_fuzzy_find'), 'Find in current buffer' },
          h = { lazy_require(tb, 'help_tags'), 'Find help' },
          t = { lazy_require(tb, 'tags'), 'Find tags' },
          T = { lazy_require(tb, 'colorscheme'), 'Select colorscheme' },
          d = { lazy_require(tb, 'grep_string'), 'Grep word under cursor' },
          p = { lazy_require(tb, 'live_grep'), 'Grep in files' },
          r = { lazy_require(tb, 'lsp_references'), 'Search LSP references in workspace' },
          o = { lazy_require(tb, 'document_symbols'), 'Search current document symbols' },
          s = { lazy_require('session-lens', 'search_session'), 'Search Session' },
          ["'"] = { lazy_require(tb, 'marks'), 'Search marks' },
        },
        ['<space>'] = { lazy_require(tb, 'buffers'), 'Buffers' },
        ['?'] = { lazy_require(tb, 'oldfiles'), 'Find oldfiles' },
      },
    }
  end,
}

return search
