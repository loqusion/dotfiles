---@type Feature[]
local plugins = {
  require 'plugins.basic',
  require 'plugins.color_hint',
  require 'plugins.snippets',
  require 'plugins.completion',
  require 'plugins.editor',
  require 'plugins.syntax',
  require 'plugins.git',
  require 'plugins.debug',
  require 'plugins.external',
  require 'plugins.run',
  require 'plugins.terminal',
  require 'plugins.ui',
  require 'plugins.search',
  require 'plugins.theme',
  require 'plugins.statusline', -- must load after theme
  require 'plugins.lsp',
}

for _, lang in ipairs(require 'plugins.languages') do
  table.insert(plugins, lang)
end
table.insert(plugins, require 'plugins.format') -- must load after languages

require('crows').setup {
  modules = { 'plugins' },
  features = plugins,
}

return plugins
