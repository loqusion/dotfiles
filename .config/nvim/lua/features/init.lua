---@type Feature[]
local features = {
  require 'features.basic',
  require 'features.color_hint',
  require 'features.completion',
  require 'features.editor',
  -- statusline and tabline require themes
}

for _, lang in ipairs(require 'features.languages') do
  table.insert(features, lang)
end

return features
