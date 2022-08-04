-- https://github.com/olimorris/persisted.nvim

local M = {
  safe_requires = {
    'persisted',
  },
}

function M.setup() end

function M.config()
  M.persisted.setup {
    use_git_branch = true,
    ignored_dirs = { '~', '~/repos', '~/notes' },
    before_save = function()
      vim.cmd [[
        Neotree close
        TroubleClose
      ]]
    end,
  }
end

function M.load_telescope_extension()
  local ok, telescope = pcall(require, 'telescope')
  if ok then
    telescope.load_extension 'persisted'
  end
end

return M
