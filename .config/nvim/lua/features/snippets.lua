local snippets = require('crows.utils').new_feat()

snippets.use 'L3MON4D3/LuaSnip'

snippets.use {
  'danymat/neogen',
  requires = 'nvim-treesitter',
  keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  setup = function()
    require('crows').key.maps {
      ['<localleader>d'] = {
        name = 'Neogen annotations',
        f = {
          '<cmd>lua require("neogen").generate({ type = "func" })<cr>',
          'Generate function annotations',
        },
        c = {
          '<cmd>lua require("neogen").generate({ type = "class" })<cr>',
          'Generate class annotations',
        },
      },
    }
  end,
}

return snippets
