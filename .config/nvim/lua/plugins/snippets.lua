local snippets = require('crows.utils').new_feat()

snippets.use {
  'L3MON4D3/LuaSnip',
  requires = 'rafamadriz/friendly-snippets',
  config = function()
    if not vim.g.did_load_luasnip_config then
      vim.g.did_load_luasnip_config = true
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_vscode').load { paths = '.' }
    end
  end,
}

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
