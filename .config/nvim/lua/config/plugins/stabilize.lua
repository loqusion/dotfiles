-- https://github.com/luukvbaal/stabilize.nvim

local M = {
  safe_requires = {
    'stabilize',
  },
}

function M.setup() end

function M.config()
  M.stabilize.setup()
end

return M
