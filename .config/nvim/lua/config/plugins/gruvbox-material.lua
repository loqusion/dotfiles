-- https://github.com/sainnhe/gruvbox-material

local M = {}

function M.entrance()
  vim.g.gruvbox_material_enable_italic = 1
  vim.g.gruvbox_material_transparent_background = vim.g.use_transparency
end

return M
