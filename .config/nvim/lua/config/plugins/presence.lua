-- https://github.com/andweeb/presence.nvim

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'presence')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s: %s', require('utils.api.path').current_filename(true), m),
      vim.log.levels.ERROR
    )
    return
  end

  M.presence = m
  M.presence:setup {
    enable_line_number = true,
    debounce_timeout = 5,
    main_image = 'file',
    neovim_image_text = 'hi',
  }
end

return M
