-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-frecency.nvim
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/nvim-telescope/telescope-dap.nvim
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/cljoly/telescope-repo.nvim
-- https://github.com/rmagatti/session-lens

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config()
  local telescope = require 'telescope'
  local telescope_actions = require 'telescope.actions'
  local file_browser = telescope.extensions.file_browser

  local function delete_line_before_cursor()
    vim.cmd [[exe "normal! i\<C-u>"]]
  end

  telescope.setup {
    defaults = {
      layout_strategy = 'flex',
      mappings = {
        i = {
          ['<M-BS>'] = delete_line_before_cursor,
          ['<M-f>'] = { '<S-Right>', type = 'command' },
          ['<M-b>'] = { '<S-Left>', type = 'command' },
          ['<C-a>'] = { '<Home>', type = 'command' },
          ['<C-e>'] = { '<End>', type = 'command' },
        },
        n = {
          ['<C-c>'] = telescope_actions.close,
        },
      },
    },
    pickers = {
      commands = {
        theme = 'ivy',
      },
      find_files = {
        file_ignore_patterns = { [[%.git/]], [[.*~$]] },
        hidden = true,
      },
    },
    extensions = {
      file_browser = {
        sorting_strategy = 'ascending',
        mappings = {
          i = {
            ['<C-u>'] = telescope_actions.preview_scrolling_up,
            ['<C-d>'] = telescope_actions.preview_scrolling_down,
            ['<C-f>'] = file_browser.actions.toggle_browser,
            ['<C-CR>'] = file_browser.actions.change_cwd,
          },
          n = {
            ['<C-CR>'] = file_browser.actions.change_cwd,
            ['-'] = file_browser.actions.goto_parent_dir,
          },
        },
      },
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
      repo = {
        list = {
          fd_opts = {
            '--exclude',
            '__archive__',
            '--exclude',
            '__reference__',
          },
          search_dirs = { '~/repos' },
        },
      },
      ['ui-select'] = {
        require('telescope.themes').get_dropdown {},
      },
    },
  }

  require('session-lens').setup {
    theme_conf = { border = false },
    previewer = true,
  }

  telescope.load_extension 'dap'
  telescope.load_extension 'file_browser'
  telescope.load_extension 'frecency'
  telescope.load_extension 'fzf'
  telescope.load_extension 'notify'
  telescope.load_extension 'repo'
  telescope.load_extension 'ui-select'
  require('config.plugins.project').load_telescope_extension()
end

function M.register_global_keys()
  local lazy = require 'crows.lazy'
  local tb = 'telescope.builtin'

  require('crows').key.maps {
    ['<LocalLeader>'] = {
      s = {
        name = 'telescope search',
        f = { lazy.fn(tb, 'find_files'), 'Find files' },
        v = {
          lazy.fn(tb, 'find_files', { cwd = vim.fn.stdpath 'config', hidden = false }),
          'Find in Vim config',
        },
        b = { lazy.fn(tb, 'current_buffer_fuzzy_find'), 'Find in current buffer' },
        h = { lazy.fn(tb, 'help_tags'), 'Find help' },
        m = { lazy.fn(tb, 'man_pages'), 'Find man pages' },
        t = { lazy.fn(tb, 'tags'), 'Find tags' },
        T = { lazy.fn(tb, 'colorscheme'), 'Select colorscheme' },
        d = { lazy.fn(tb, 'grep_string'), 'Grep word under cursor' },
        p = { lazy.fn(tb, 'live_grep'), 'Grep in files' },
        r = { lazy.fn(tb, 'lsp_references'), 'Search LSP references in workspace' },
        c = { lazy.fn(tb, 'commands'), 'Search commands' },
        g = { lazy.fn('telescope', 'extensions.repo.list'), 'Search git repos' },
        s = { lazy.fn('session-lens', 'search_session'), 'Search Session' },
        ["'"] = { lazy.fn(tb, 'marks'), 'Search marks' },
      },
      ['<space>'] = { lazy.fn(tb, 'buffers'), 'Buffers' },
      ['?'] = { lazy.fn(tb, 'oldfiles'), 'Find oldfiles' },
      f = { lazy.fn('telescope', 'extensions.file_browser.file_browser'), 'File browser' },
    },
  }
end

return M
