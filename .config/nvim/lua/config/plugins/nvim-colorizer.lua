-- https://github.com/norcalli/nvim-colorizer.lua

local M = {}

function M.setup() end

function M.config()
  require('colorizer').setup({
    '*',
  }, {
    RGB = true,
    RRGGBB = true,
    names = true,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
  })
end

return M
