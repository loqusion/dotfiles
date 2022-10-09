local json = {}

json.lsp_configs = {
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas {
          replace = {
            ['tsconfig.json'] = {
              description = 'TypeScript compiler configuration file',
              fileMatch = {
                'tsconfig.json',
                'tsconfig.*.json',
              },
              url = 'https://json.schemastore.org/tsconfig.json',
            },
            ['babelrc.json'] = {
              description = 'Babel configuration file',
              fileMatch = {
                '.babelrc.json',
                '.babelrc',
                'babel.config.json',
              },
              url = 'https://json.schemastore.org/babelrc.json',
            },
          },
        },
        validate = { enable = true },
      },
    },
  },
}

return json
