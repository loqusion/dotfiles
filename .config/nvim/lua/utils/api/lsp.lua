local M = {}

local has_v0_8 = vim.fn.has 'nvim-0.8' ~= 0

function M.enable_formatting(client, _)
  local cap = has_v0_8 and client.server_capabilities or client.resolved_capabilities

  cap.documentFormattingProvider = true
end

function M.disable_formatting(client, _)
  local cap = has_v0_8 and client.server_capabilities or client.resolved_capabilities

  cap.documentFormattingProvider = false
end

local function format_async()
  vim.lsp.buf.format { async = true }
end

M.format = has_v0_8 and format_async or vim.lsp.buf.formatting

function M.map_formatting()
  require('utils.api').key.maps({
    ['<Leader>'] = {
      f = { M.format, 'Format' },
    },
  }, {})
end

return M
