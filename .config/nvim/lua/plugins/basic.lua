local basic = require('crows.utils').new_feat()

basic.use 'lewis6991/impatient.nvim'

basic.use 'antoinemadec/FixCursorHold.nvim'

basic.use {
  'rmagatti/auto-session',
  config = true,
}

-- improve vim select/input UI
basic.use {
  'stevearc/dressing.nvim',
  config = true,
}

return basic
