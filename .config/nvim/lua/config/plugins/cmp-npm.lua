-- https://github.com/David-Kunz/cmp-npm

local M = {
  safe_requires = {
    {'cmp-npm', 'cmp_npm'}
  }
}

function M.setup() end

function M.config()
  M.cmp_npm.setup()
end

return M
