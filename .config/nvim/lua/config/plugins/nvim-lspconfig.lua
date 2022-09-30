-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim

local util = require 'vim.lsp.util'
local api = require 'utils.api'

local M = {
  safe_requires = {
    'mason',
    { 'mason-lspconfig', 'mason_lspconfig' },
  },
}

function M.setup() end

function M.config()
  -- required before lspconfig setup
  M.mason.setup()
  M.mason_lspconfig.setup {
    -- automatic_installation = true,
    automatic_installation = {
      exclude = {
        -- 'angularls',
        'haskell-language-server',
      },
    },
  }

  local lsp = require 'crows.lsp'

  -- use null-ls for formatting
  lsp.add_on_attach(api.lsp.disable_formatting)

  local languages = api.path.require_recursive 'config.languages'
  for _, module in pairs(languages) do
    if module.lsp_configs then
      for name, config in pairs(module.lsp_configs) do
        lsp.set_config(name, config)
      end
    end
  end

  M.override_handlers()
end

local old_location_handler = vim.lsp.handlers['textDocument/definition']
--- set qflist, but don't open it automatically
local function location_handler(param1, result, ctx, param4)
  if vim.tbl_islist(result) then
    old_location_handler(param1, result[1], ctx, param4)
    if #result > 1 then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.fn.setqflist({}, ' ', {
        title = 'LSP locations',
        items = util.locations_to_items(result, client.offset_encoding),
      })
    end
  else
    old_location_handler(param1, result, ctx, param4)
  end
end

function M.override_handlers()
  vim.lsp.handlers['textDocument/declaration'] = location_handler
  vim.lsp.handlers['textDocument/definition'] = location_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = location_handler
  vim.lsp.handlers['textDocument/implementation'] = location_handler
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
  })
end

return M
