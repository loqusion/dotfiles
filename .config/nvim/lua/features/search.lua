local crows = require 'crows'
---@type Feature
local search = { plugins = {} }

search.pre = function()
  vim.opt.ignorecase = true
end

search.post = function()
  crows.key.map('Clear search', 'n', '<leader>/', '<cmd>nohlsearch<cr>')
end

-- telescope
search.plugins[#search.plugins + 1] = {
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
    -- lazy load telescope by wrapping requires in functions
    local t = {
      find_files = function()
        require('telescope.builtin').find_files { hidden = true }
      end,
      find_files_vim = function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      current_buffer_fuzzy_find = function()
        require('telescope.builtin').current_buffer_fuzzy_find()
      end,
      help_tags = function()
        require('telescope.builtin').help_tags()
      end,
      tags = function()
        require('telescope.builtin').tags()
      end,
      colorscheme = function()
        require('telescope.builtin').colorscheme()
      end,
      grep_string = function()
        require('telescope.builtin').grep_string()
      end,
      live_grep = function()
        require('telescope.builtin').live_grep()
      end,
      lsp_references = function()
        require('telescope.builtin').lsp_references()
      end,
      document_symbols = function()
        require('telescope.builtin').document_symbols()
      end,
      session_lens = function()
        require('session-lens').search_session()
      end,
      marks = function()
        require('telescope.builtin').marks()
      end,
      buffers = function()
        require('telescope.builtin').buffers()
      end,
      oldfiles = function()
        require('telescope.builtin').oldfiles()
      end,
    }

    require('crows').key.maps {
      ['<leader>'] = {
        name = 'telescope search',
        s = {
          f = { t.find_files, 'Find files' },
          v = { t.find_files_vim, 'Find in Vim config' },
          b = { t.current_buffer_fuzzy_find, 'Find in current buffer' },
          h = { t.help_tags, 'Find help' },
          t = { t.tags, 'Find tags' },
          T = { t.colorscheme, 'Select colorscheme' },
          d = { t.grep_string, 'Grep word under cursor' },
          p = { t.live_grep, 'Grep in files' },
          r = { t.lsp_references, 'Search LSP references in workspace' },
          o = { t.document_symbols, 'Search current document symbols' },
          s = { t.session_lens, 'Search Session' },
          ["'"] = { t.marks, 'Search marks' },
        },
        ['<space>'] = { t.buffers, 'Buffers' },
        ['?'] = { t.oldfiles, 'Find oldfiles' },
      },
    }
  end,
}

return search
