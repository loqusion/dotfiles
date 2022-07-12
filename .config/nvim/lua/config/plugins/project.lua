-- https://github.com/ahmedkhalf/project.nvim

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'project_nvim')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s', require('utils.api.path').current_filename(true)),
      vim.log.levels.ERROR
    )
    return
  end

  M.project_nvim = m
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
