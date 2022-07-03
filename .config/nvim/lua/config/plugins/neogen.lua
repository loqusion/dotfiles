-- https://github.com/danymat/neogen

local M = {}

function M.setup()
  M.register_global_keys()
end

function M.config() end

function M.register_global_keys()
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
    -- ['<C-e>'] = {
    --   function()
    --     require('neogen').jump_next()
    --   end,
    --   { 'Jump next neogen annotation', mode = 'i' },
    -- },
  }
end

return M
