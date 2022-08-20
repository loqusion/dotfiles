-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-frecency.nvim
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/nvim-telescope/telescope-dap.nvim
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/cljoly/telescope-repo.nvim

local M = {
  safe_requires = {
    'telescope',
    { 'telescope.actions', 'telescope_actions' },
  },
}

function M.setup()
  M.register_global_keys()
end

function M.config()
  local file_browser = M.telescope.extensions.file_browser

  local function delete_line_before_cursor()
    vim.cmd [[exe "normal! i\<C-u>"]]
  end

  M.telescope.setup {
    defaults = {
      prompt_prefix = '🔭 ',
      selection_caret = ' ',
      layout_strategy = 'flex',
      layout_config = {
        flex = {
          flip_columns = 200,
        },
      },
      mappings = {
        i = {
          ['<C-b>'] = { '<Left>', type = 'command' },
          ['<C-f>'] = { '<Right>', type = 'command' },
          ['<M-f>'] = M.telescope_actions.preview_scrolling_down,
          ['<M-d>'] = M.telescope_actions.preview_scrolling_up,
          ['<C-a>'] = { '<Home>', type = 'command' },
          ['<C-e>'] = { '<End>', type = 'command' },
          ['<C-u>'] = delete_line_before_cursor,
          ['<C-d>'] = false,
        },
        n = {
          ['<C-c>'] = M.telescope_actions.close,
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
            ['<C-u>'] = M.telescope_actions.preview_scrolling_up,
            ['<C-d>'] = M.telescope_actions.preview_scrolling_down,
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
        require('telescope.themes').get_cursor {},
      },
    },
  }

  M.telescope.load_extension 'dap'
  M.telescope.load_extension 'file_browser'
  M.telescope.load_extension 'frecency'
  M.telescope.load_extension 'fzf'
  M.telescope.load_extension 'notify'
  M.telescope.load_extension 'repo'
  M.telescope.load_extension 'ui-select'
  M.telescope.load_extension 'zoxide'
  require('config.plugins.persisted').load_telescope_extension()
  require('config.plugins.project').load_telescope_extension()
end

function M.register_global_keys()
  local lazy = require 'crows.lazy'
  local tb = 'telescope.builtin'

  require('crows').key.maps {
    ['<Space>'] = {
      s = {
        name = 'Telescope',
        f = { lazy.fn(tb, 'find_files'), 'Search files...' },
        v = {
          lazy.fn(tb, 'find_files', { cwd = vim.fn.stdpath 'config', hidden = false }),
          'Search Vim config...',
        },
        b = { lazy.fn(tb, 'current_buffer_fuzzy_find'), 'Fuzzy find in current buffer...' },
        h = { lazy.fn(tb, 'help_tags'), 'Go to help page...' },
        m = { lazy.fn(tb, 'man_pages'), 'Go to man page...' },
        -- t = { lazy.fn(tb, 'tags'), 'Find tags...' },
        t = { lazy.fn(tb, 'lsp_dynamic_workspace_symbols'), 'Go to symbol in workspace...' },
        o = { lazy.fn(tb, 'lsp_document_symbols'), 'Go to symbol in document...' },
        -- T = { lazy.fn(tb, 'colorscheme'), 'Select colorscheme...' },
        d = { lazy.fn(tb, 'grep_string'), 'Find word under cursor...' },
        p = { lazy.fn(tb, 'live_grep'), 'Find in files...' },
        r = { lazy.fn(tb, 'lsp_references'), 'Search LSP references in workspace' },
        c = { lazy.fn(tb, 'commands'), 'Show all commands...' },
        g = { lazy.fn('telescope', 'extensions.repo.list'), 'Open git repo...' },
        s = { lazy.fn('telescope', 'extensions.persisted.persisted'), 'Open session...' },
        ["'"] = { lazy.fn(tb, 'marks'), 'Go to mark...' },
      },
      ['<space>'] = { lazy.fn(tb, 'buffers'), 'Go to buffer...' },
      ['?'] = { lazy.fn(tb, 'oldfiles'), 'Go to recently opened...' },
    },
  }
end

return M
