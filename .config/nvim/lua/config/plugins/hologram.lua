-- https://github.com/edluffy/hologram.nvim

local M = {
  safe_requires = {
    'hologram',
  },
}

function M.setup() end

function M.config()
  M.hologram.setup {
    auto_display = true,
  }
end

return M
