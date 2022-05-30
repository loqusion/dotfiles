require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'palenight',
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
      },
      { 'filename', path = 1 },
      [[require('lsp-status').status()]],
    },
    lualine_x = {
      { 'encoding', separator = '|' },
      { 'fileformat', icons_enabled = false, separator = '|' },
      { 'filetype', separator = '|' },
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'tabs' },
  },
  extensions = {
    'fugitive',
    'quickfix',
    'symbols-outline',
    'toggleterm',
  },
}
