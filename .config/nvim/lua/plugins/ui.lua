local ui = require('crows.utils').new_feat()

ui.use {
  'folke/noice.nvim',
  requires = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  event = 'VimEnter',
  config = true,
}

ui.use {
  'glepnir/dashboard-nvim',
  config = true,
  after = 'persisted.nvim',
}

ui.use {
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  setup = true,
  config = true,
}

ui.use {
  -- 'Pocco81/true-zen.nvim',
  'loqusion/true-zen.nvim',
  -- '~/repos/true-zen.nvim',
  disable = true,
  cmd = { 'TZAtaraxis', 'TZFocus', 'TZMinimalist', 'TZNarrow' },
  setup = true,
  config = true,
}

ui.use {
  'folke/twilight.nvim',
  -- 'loqusion/twilight.nvim', -- Use this one until https://github.com/folke/twilight.nvim/issues/15 is resolved
  setup = true,
}

-- undotree
ui.use {
  'mbbill/undotree',
  ptp = 'viml',
  event = 'VimEnter',
  setup = true,
}

-- symbols outline
ui.use {
  'simrat39/symbols-outline.nvim',
  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
  setup = true,
  config = true,
}

ui.use { -- Stabilize buffer content on window open-close events
  'luukvbaal/stabilize.nvim',
  config = true,
}

ui.use {
  'petertriho/nvim-scrollbar',
  -- event = {'BufRead', 'BufNewFile'},
  -- module = 'scrollbar',
  config = true,
}

ui.use { -- Ultra fold
  'kevinhwang91/nvim-ufo',
  requires = 'kevinhwang91/promise-async',
  event = 'VimEnter',
  setup = true,
  config = true,
}

ui.use { -- Terminal image viewer
  'edluffy/hologram.nvim',
  disable = true,
  config = true,
}

return ui
