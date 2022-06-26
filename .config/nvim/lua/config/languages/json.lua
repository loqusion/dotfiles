local lazy = require 'crows.lazy'

local json = {}

json.lsp_configs = {
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  },
}

json.formatters = {
  json = {
    lazy.fn 'formatter.defaults.prettier',
  },
}

return json
