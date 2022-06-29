-- https://github.com/ahmedkhalf/project.nvim

local M = {}

function M.setup() end

function M.config()
  require('project_nvim').setup()
  M.load_telescope_extension()
end

function M.load_telescope_extension()
  local ok, telescope = pcall(require, 'telescope')
  if ok then
    telescope.load_extension 'projects'
  end
end

return M
