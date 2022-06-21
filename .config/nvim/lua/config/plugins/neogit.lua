-- https://github.com/TimUntersberger/neogit

local M = {}

function M.setup() end

function M.config()
  require('neogit').setup {
    integrations = { diffview = true },
    disable_commit_confirmation = true,
    disable_signs = true,
  }
end

return M
