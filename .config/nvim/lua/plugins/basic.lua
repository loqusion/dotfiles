local basic = require('crows.utils').new_feat()

basic.use 'lewis6991/impatient.nvim' -- Improve startup time

basic.use 'antoinemadec/FixCursorHold.nvim' -- Fix Neovim CursorHold and CursorHoldI

basic.use { -- A small automated session manager
  'rmagatti/auto-session',
  config = true,
}

basic.use { -- Improve default vim.ui interfaces
  'stevearc/dressing.nvim',
  config = true,
}

return basic
