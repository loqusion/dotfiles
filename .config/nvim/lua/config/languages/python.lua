local lazy = require 'crows.lazy'

local python = {}

python.lsp_configs = {
  pyright = {},
}

python.formatters = {
  python = {
    lazy.fn('formatter.defaults.python', 'yapf'),
  },
}

return python
