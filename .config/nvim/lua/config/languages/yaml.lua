local yaml = {}

yaml.lsp_configs = {
  yamlls = {},
}

yaml.formatters = {
  yaml = {
    require 'config.formatters.prettier',
  },
}

return yaml
