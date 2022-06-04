---@type Feature
local color_hint = {}

color_hint.plugins = {
  { 'norcalli/nvim-colorizer.lua', opt = true },
}

function color_hint.toggle_colors()
  vim.cmd [[packadd nvim-colorizer.lua]]
  vim.cmd [[ColorizerToggle]]
end

function color_hint.post()
  vim.api.nvim_create_user_command('ToggleColors', color_hint.toggle_colors, {})
end

return color_hint
