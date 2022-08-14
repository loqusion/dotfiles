-- https://github.com/williamboman/nvim-lsp-installer

local util = require 'vim.lsp.util'
local api = require 'utils.api'

local M = {
  safe_requires = {
    { 'nvim-lsp-installer', 'lsp_installer' },
  },
  lsp_root_directory = api.path.join(vim.fn.stdpath 'config', 'lua', 'config', 'languages'),
}

function M.setup() end

function M.config()
  -- required before lspconfig setup
  M.lsp_installer.setup { automatic_installation = true }

  M.override_handlers()

  local lsp = require 'crows.lsp'
  local file_list = vim.fn.globpath(M.lsp_root_directory, '*.lua', false, true)

  for _, file in ipairs(file_list) do
    local module = require('config.languages.' .. vim.fn.fnamemodify(file, ':t:r'))
    if module.lsp_configs then
      for name, config in pairs(module.lsp_configs) do
        lsp.set_config(name, config)
      end
    end
  end
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
