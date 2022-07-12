-- https://github.com/ray-x/lsp_signature.nvim

local M = {}

function M.setup() end

function M.config()
  require('crows.lsp').add_on_attach(function(_, bufnr)
    require('lsp_signature').on_attach({
      bind = true,
      handler_opts = {
        border = 'none',
      },
    }, bufnr)
  end)
end

return M
