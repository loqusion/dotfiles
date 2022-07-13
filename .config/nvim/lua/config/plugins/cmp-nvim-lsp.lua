-- https://github.com/hrsh7th/cmp-nvim-lsp

local M = {
  safe_requires = {
    'cmp_nvim_lsp',
  },
}

function M.setup() end

function M.config()
  require('crows.lsp').add_caps_setter(M.cmp_nvim_lsp.update_capabilities)
end

return M
