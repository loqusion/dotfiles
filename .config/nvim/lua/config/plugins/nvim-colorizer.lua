-- https://github.com/norcalli/nvim-colorizer.lua

local M = {
  safe_requires = {
    'colorizer',
  },
}

function M.setup() end

function M.config()
  M.colorizer.setup({
    'html',
    'css',
    'sass',
    'scss',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'lua',
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
