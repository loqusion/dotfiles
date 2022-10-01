local M = {}

local has_v0_8 = vim.fn.has('nvim-0.8') ~= 0

function M.enable_formatting(client, _)
  local cap = has_v0_8 and client.server_capabilities or client.resolved_capabilities

  cap.document_formatting = true
  cap.document_range_formatting = true
end

function M.disable_formatting(client, _)
  local cap = has_v0_8 and client.server_capabilities or client.resolved_capabilities

  cap.document_formatting = false
  cap.document_range_formatting = false
end

local function format_async()
  vim.lsp.buf.format { async = true }
end

function M.map_formatting()
  local fmt = has_v0_8 and format_async or vim.lsp.buf.formatting

  require('crows').key.maps({
    ['<Leader>'] = {
      f = { fmt, 'Format' },
    },
  }, {})
end

return M
