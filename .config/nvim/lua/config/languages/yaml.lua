local lazy = require 'crows.lazy'

local yaml = {}

yaml.lsp_configs = {
  yamlls = {},
}

yaml.formatters = {
  yaml = {
    lazy.fn 'formatter.defaults.prettier',
  },
}

return yaml
