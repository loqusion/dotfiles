-- https://github.com/RRethy/vim-illuminate

local M = {}

function M.setup() end

function M.config()
  require('crows.lsp').add_on_attach(function(client)
    require('illuminate').on_attach(client)
  end)
  vim.g.Illuminate_delay = 100
end

return M
