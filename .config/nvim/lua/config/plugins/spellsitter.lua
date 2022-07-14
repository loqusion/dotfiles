-- https://github.com/lewis6991/spellsitter.nvim

local M = {
  safe_requires = {
    'spellsitter',
  },
}

function M.setup() end

function M.config()
  M.spellsitter.setup()
end

return M
