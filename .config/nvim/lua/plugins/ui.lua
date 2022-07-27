local ui = require('crows.utils').new_feat()

ui.use {
  'Pocco81/TrueZen.nvim',
  cmd = { 'TZAtaraxis', 'TZFocus', 'TZMinimalist' },
  setup = true,
  config = true,
}

ui.use {
  -- 'folke/twilight.nvim',
  'loqusion/twilight.nvim', -- Use this one until https://github.com/folke/twilight.nvim/issues/15 is resolved
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

return ui
