local format = require('crows.utils').new_feat()

format.use {
  'mhartington/formatter.nvim',
  disable = true,
  cmd = { 'Format', 'FormatWrite' },
  setup = true,
  config = true,
}

return format
