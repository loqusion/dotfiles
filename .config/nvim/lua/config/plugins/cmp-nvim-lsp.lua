-- https://github.com/hrsh7th/cmp-nvim-lsp

local M = {}

function M.setup() end

function M.config()
  require('crows.lsp').add_caps_setter(require('cmp_nvim_lsp').update_capabilities)
end

return M
