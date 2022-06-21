-- https://github.com/danymat/neogen

local M = {}

function M.setup()
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
end

function M.config() end

return M
