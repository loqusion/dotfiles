-- https://github.com/lukas-reineke/headlines.nvim

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'headlines')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s', require('utils.api.path').current_filename(true)),
      vim.log.levels.ERROR
    )
    return
  end

  M.headlines = m
  M.headlines.setup {}
end

return M
