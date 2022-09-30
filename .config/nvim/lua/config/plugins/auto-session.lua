-- https://github.com/rmagatti/auto-session

local M = {
  safe_requires = {
    { 'auto-session', 'auto_session' },
  },
}

function M.setup() end

function M.config()
  M.auto_session.setup {
    auto_restore_enabled = false,
    auto_session_use_git_branch = false,
    auto_session_suppress_dirs = { '~' },
  }
end

return M
