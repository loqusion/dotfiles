-- https://github.com/ahmedkhalf/project.nvim

local M = {
  safe_requires = {
    'project_nvim'
  }
}

function M.setup() end

function M.config()
  M.project_nvim.setup{
    manual_mode = true, -- otherwise conflicts with auto-session
  }
end

function M.load_telescope_extension()
  local ok, telescope = pcall(require, 'telescope')
  if ok then
    telescope.load_extension 'projects'
  end
end

return M
