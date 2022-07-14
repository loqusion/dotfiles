-- https://github.com/andweeb/presence.nvim

local M = {
  safe_requires = {
    'presence',
  },
}

function M.setup() end

function M.config()
  M.presence:setup {
    enable_line_number = true,
    debounce_timeout = 5,
    main_image = 'file',
    neovim_image_text = 'hi',
  }
end

return M
