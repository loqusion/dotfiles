-- https://github.com/ray-x/lsp_signature.nvim
local options = require 'core.options'

local M = {
  safe_requires = {
    'lsp_signature',
  },
}

function M.setup() end

function M.config()
  require('crows.lsp').add_on_attach(function(_, bufnr)
    M.lsp_signature.on_attach({
      bind = true,
      floating_window = false,
      handler_opts = {
        border = options.border_style,
      },
      shadow_blend = 69,
      -- transparency = 10,
      hint_enable = true,
      hint_prefix = 'α ',
      toggle_key = '<C-k>',
      select_signature_key = '<M-m>',
    }, bufnr)
  end)
end

return M
