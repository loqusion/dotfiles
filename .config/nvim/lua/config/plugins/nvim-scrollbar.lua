-- https://github.com/petertriho/nvim-scrollbar

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'scrollbar')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s: %s', require('utils.api.path').current_filename(true), m),
      vim.log.levels.ERROR
    )
    return
  end

  M.scrollbar = m
  M.scrollbar.setup {
    handlers = {
      search = true,
    },
  }
  -- require('scrollbar.handlers.search').setup()
end

return M
