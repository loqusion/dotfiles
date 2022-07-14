-- https://github.com/akinsho/git-conflict.nvim

local M = {
  safe_requires = {
    { 'git-conflict', 'git_conflict' },
  },
}

function M.setup() end

function M.config()
  M.git_conflict.setup {}
end

return M
