-- https://github.com/windwp/nvim-projectconfig

local M = {
  safe_requires = {
    { 'nvim-projectconfig', 'projectconfig' },
  },
}

function M.setup() end

function M.config()
  M.projectconfig.setup {
    project_dir = '~/.local/share/nvim/projectrc/',
    autocmd = true,
  }
end

return M
