local format = require('crows.utils').new_feat()

format.use {
  'mhartington/formatter.nvim',
  cmd = { 'Format', 'FormatWrite' },
  event = { 'BufWritePre' },
  setup = true,
  config = true,
}

return format
