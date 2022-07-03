local external = require('crows.utils').new_feat()

external.use {
  'tyru/open-browser.vim',
  ptp = 'viml',
  setup = true,
}
external.use {
  'rizzatti/dash.vim',
  cmd = { 'Dash', 'DashKeywords' },
  keys = { '<Plug>DashSearch', '<Plug>DashGlobalSearch' },
  setup = true,
}
external.use {
  'andweeb/presence.nvim',
  event = 'ColorScheme',
  config = true,
}

return external
