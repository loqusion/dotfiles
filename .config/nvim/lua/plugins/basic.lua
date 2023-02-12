local basic = require('crows.utils').new_feat()

basic.use { 'wbthomason/packer.nvim', opt = true }

basic.use 'lewis6991/impatient.nvim' -- Improve startup time

basic.use 'antoinemadec/FixCursorHold.nvim' -- Fix Neovim `CursorHold` and `CursorHoldI`

basic.use { -- Automated session management
  'olimorris/persisted.nvim',
  config = true,
}

basic.use { -- Session manager
  'Shatur/neovim-session-manager',
  disable = true,
  config = true,
}

basic.use {
  'rcarriga/nvim-notify',
  config = true,
}

basic.use { -- improve vim select/input UI
  'stevearc/dressing.nvim',
  config = true,
}

basic.use {
  'kyazdani42/nvim-web-devicons',
  config = true,
}

return basic
