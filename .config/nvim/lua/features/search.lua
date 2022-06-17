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
  'https://gitlab.com/yorickpeterse/nvim-pqf.git',
  config = function()
    require('pqf').setup {
      signs = {
        error = '',
        warning = '',
        info = '',
        hint = '',
      },
    }
  end,
}

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
    vim.cmd [[command! Todo Grepper -noprompt -tool git -query -E '(TODO|FIXME|BUG|XXX):']]
  end,
}

-- telescope
search.use {
  'nvim-telescope/telescope.nvim',
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
    { 'nvim-telescope/telescope-ui-select.nvim', after = 'telescope.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'cljoly/telescope-repo.nvim' },
    { 'rmagatti/session-lens' },
  },
  wants = {
    'popup.nvim',
    'plenary.nvim',
    'telescope-frecency.nvim',
    'telescope-fzf-native.nvim',
  },
  module = 'telescope',
  config = function()
    local telescope = require 'telescope'
    telescope.load_extension 'dap'
    telescope.load_extension 'file_browser'
    telescope.load_extension 'frecency'
    telescope.load_extension 'fzf'
    telescope.load_extension 'repo'
    telescope.load_extension 'ui-select'

    telescope.setup {
      defaults = {
        layout_strategy = 'flex',
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-f>'] = require('telescope.actions').preview_scrolling_down,
            ['<C-d>'] = require('telescope.actions').preview_scrolling_up,
            ['<M-f>'] = { '<S-Right>', type = 'command' },
            ['<M-b>'] = { '<S-Left>', type = 'command' },
            ['<C-a>'] = { '<Home>', type = 'command' },
            ['<C-e>'] = { '<End>', type = 'command' },
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { [[\.git/]] },
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
    local lazy = require 'crows.lazy'
    local tb = 'telescope.builtin'
    require 'session-lens'

    require('crows').key.maps {
      ['<leader>'] = {
        s = {
          name = 'telescope search',
          f = { lazy.fn(tb, 'find_files', { hidden = true }), 'Find files' },
          v = {
            lazy.fn(tb, 'find_files', { cwd = vim.fn.stdpath 'config' }),
            'Find in Vim config',
          },
          b = { lazy.fn(tb, 'current_buffer_fuzzy_find'), 'Find in current buffer' },
          h = { lazy.fn(tb, 'help_tags'), 'Find help' },
          t = { lazy.fn(tb, 'tags'), 'Find tags' },
          T = { lazy.fn(tb, 'colorscheme'), 'Select colorscheme' },
          d = { lazy.fn(tb, 'grep_string'), 'Grep word under cursor' },
          p = { lazy.fn(tb, 'live_grep'), 'Grep in files' },
          r = { lazy.fn(tb, 'lsp_references'), 'Search LSP references in workspace' },
          o = { lazy.fn(tb, 'lsp_document_symbols'), 'Search current document symbols' },
          g = {
            lazy.fn('telescope', 'extensions.repo.cached_list', { search_dirs = { '~/Projects' } }),
            'Search git repos',
          },
          s = {
            lazy.fn('session-lens', 'search_session', {
              path_display = { 'shorten' },
              theme_conf = { border = false },
              previewer = true,
            }),
            'Search Session',
          },
          ["'"] = { lazy.fn(tb, 'marks'), 'Search marks' },
        },
        ['<space>'] = { lazy.fn(tb, 'buffers'), 'Buffers' },
        ['?'] = { lazy.fn(tb, 'oldfiles'), 'Find oldfiles' },
      },
      ['<localleader>'] = {
        fb = { ':Telescope file_browser<CR>', 'File browser' },
      },
    }
  end,
}

return search
