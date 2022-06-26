local lazy = require 'crows.lazy'

local markdown = {}

markdown.formatters = {
  markdown = {
    lazy.fn 'formatter.defaults.prettier',
  },
}

return markdown
