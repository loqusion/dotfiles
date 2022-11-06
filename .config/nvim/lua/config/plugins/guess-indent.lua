-- https://github.com/NMAC427/guess-indent.nvim

local M = {
  safe_requires = {
    { 'guess-indent', 'guess_indent' },
  },
}

function M.setup() end

function M.config()
  M.guess_indent.setup {
    auto_cmd = true,
  }
end

return M
