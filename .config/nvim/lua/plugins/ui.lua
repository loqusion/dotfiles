local ui = require('crows.utils').new_feat()

ui.use {
  'Pocco81/TrueZen.nvim',
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
  event = 'VimEnter',
  ptp = 'viml',
}

-- symbols outline
ui.use {
  'simrat39/symbols-outline.nvim',
  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
  setup = true,
}

return ui
