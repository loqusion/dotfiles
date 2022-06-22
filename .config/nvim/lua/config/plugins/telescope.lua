-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-frecency.nvim
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/nvim-telescope/telescope-dap.nvim
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/cljoly/telescope-repo.nvim
-- https://github.com/rmagatti/session-lens

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config()
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
        file_ignore_patterns = { [[%.git/]], [[.*~$]] },
      },
    },
    extensions = {
      frecency = {
        workspaces = {
          clientele = '/Users/rasnauf/repos/clientele',
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
end

function M.register_global_keys()
  local lazy = require 'crows.lazy'
  local tb = 'telescope.builtin'

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
          lazy.fn('telescope', 'extensions.repo.cached_list', { search_dirs = { '~/repos' } }),
          'Search git repos',
        },
        s = {
          lazy.fn('session-lens', 'search_session', {
            -- path_display = { 'shorten' },
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
      f = { lazy.fn('telescope', 'extensions.file_browser.file_browser'), 'File browser' },
    },
  }
end

return M
