-- https://github.com/TimUntersberger/neogit

local M = {
  safe_requires = {
    'neogit'
  }
}

function M.setup() end

function M.config()
  M.neogit.setup {
    integrations = { diffview = true },
    disable_commit_confirmation = true,
    disable_signs = true,
  }
end

return M
