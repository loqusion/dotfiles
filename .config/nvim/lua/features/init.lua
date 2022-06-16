---@type Feature[]
local features = {
  require 'features.basic',
  require 'features.color_hint',
  require 'features.snippets',
  require 'features.completion',
  require 'features.editor',
  require 'features.syntax',
  require 'features.debug',
  require 'features.external',
  require 'features.run',
  require 'features.terminal',
  require 'features.ui',
  require 'features.file_browser',
  require 'features.search',
  -- statusline requires themes
  require 'features.theme',
  require 'features.statusline',
  require 'features.lsp',
}

for _, lang in ipairs(require 'features.languages') do
  table.insert(features, lang)
end
-- format requires languages
table.insert(features, require 'features.format')

return features
