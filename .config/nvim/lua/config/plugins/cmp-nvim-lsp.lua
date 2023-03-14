-- https://github.com/hrsh7th/cmp-nvim-lsp

local M = {
  safe_requires = {
    'cmp_nvim_lsp',
  },
}

function M.setup() end

function M.config()
  require('utils.aux.lsp').add_caps_setter(M.cmp_nvim_lsp.default_capabilities)
end

return M
