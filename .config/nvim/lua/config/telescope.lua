local telescope = require('telescope')

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

-- Extensions
telescope.load_extension 'frecency'
telescope.load_extension 'fzf'
telescope.load_extension 'ui-select'
telescope.load_extension 'dap'
