-- https://github.com/milisims/foldhue.nvim

local M = {
  safe_requires = {
    'foldhue'
  }
}

function M.setup()
end

function M.config()
  M.foldhue.enable()
end

return M
