-- https://github.com/RRethy/vim-illuminate

local M = {}

function M.setup()
  require('crows.lsp').add_on_attach(function(client, bufnr)
    M.register_buffer_keys(bufnr)
    require('illuminate').on_attach(client)
  end)
  vim.g.Illuminate_delay = 100
end

function M.config() end

function M.register_buffer_keys(bufnr)
  require('crows').key.maps({
    ['<F7>'] = {
      '<Cmd>lua require("illuminate").next_reference({ wrap = true })<CR>',
      'Goto next reference',
    },
    ['<S-F7>'] = {
      '<Cmd>lua require("illuminate").next_reference({ reverse = true, wrap = true })<CR>',
      'Goto previous reference',
    },
  }, { buffer = bufnr })
end

return M
