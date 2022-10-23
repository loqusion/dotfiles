local options = require 'core.options'

if options.colorscheme then
  vim.cmd('colorscheme ' .. options.colorscheme)
end
