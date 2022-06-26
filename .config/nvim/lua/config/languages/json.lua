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
    require 'config.formatters.prettier',
  },
}

return json
