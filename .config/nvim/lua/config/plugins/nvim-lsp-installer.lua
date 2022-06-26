-- https://github.com/williamboman/nvim-lsp-installer

local M = {}

function M.setup() end

function M.config()
  -- required before lspconfig setup
  require('nvim-lsp-installer').setup { automatic_installation = true }

  local lsp = require 'crows.lsp'
  local languages = require 'config.languages'

  for _, module in pairs(languages) do
    if module.lsp_configs then
      for name, config in pairs(module.lsp_configs) do
        lsp.set_config(name, config)
      end
    end
  end
end

return M
