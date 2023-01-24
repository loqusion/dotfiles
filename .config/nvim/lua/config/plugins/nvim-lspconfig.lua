-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim

local util = require 'vim.lsp.util'
local api = require 'utils.api'
local options = require 'core.options'

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

  lsp.add_on_attach(M.configure_formatting)

  local languages = api.path.require_recursive 'config.languages'
  for _, module in pairs(languages) do
    if module.lsp_configs then
      for name, config in pairs(module.lsp_configs) do
        lsp.set_config(name, config)
      end
    end
  end

  M.override_handlers()
  M.style_handlers()
  M.highlights()
  M.register_global_autocmds()
end

function M.configure_formatting(client, buf)
  local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
  local enable_formatting = false
  if require('config.plugins.null-ls').has_formatter(filetype) then
    enable_formatting = client.name == 'null-ls'
  else
    enable_formatting = client.name ~= 'null-ls'
  end
  client.server_capabilities.documentFormattingProvider = enable_formatting
end

local old_location_handler = vim.lsp.handlers['textDocument/definition']
--- set qflist, but don't open it automatically
local function location_handler(param1, result, ctx, param4)
  if vim.tbl_islist(result) then
    old_location_handler(param1, result[1], ctx, param4)
    if #result > 1 then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      local qf_items = util.locations_to_items(result, client.offset_encoding)
      api.notify('Multiple results in qflist', vim.log.levels.INFO)
      vim.fn.setqflist({}, ' ', {
        title = 'LSP locations',
        items = qf_items,
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
    virtual_text = true,
  })
end

function M.style_handlers()
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = options.border_style })
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = options.border_style }
  )
  vim.diagnostic.config {
    float = { border = options.border_style },
  }
end

function M.highlights()
  vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Green' })
end

function M.register_global_autocmds()
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = M.highlights,
  })
end

return M
