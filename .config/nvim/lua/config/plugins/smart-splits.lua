-- https://github.com/mrjones2014/smart-splits.nvim

local M = {
  safe_requires = {
    { 'smart-splits', 'smart_splits' },
  },
}

function M.setup() end

function M.config()
  M.smart_splits.setup {}
end

return M
