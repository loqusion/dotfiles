---@type Feature[]
local plugins = {
  require 'plugins.basic',
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
  require 'plugins.languages',
  require 'plugins.format',
}

require('crows').setup {
  modules = { 'plugins' },
  features = plugins,
}

return plugins
