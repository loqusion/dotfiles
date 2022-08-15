local M = {}

local is_prerelease = vim.version().prerelease

-- use null-ls for formatting
function M.disable_formatting(client, _)
  local cap = is_prerelease and client.server_capabilities or client.resolved_capabilities

  cap.document_formatting = false
  cap.document_range_formatting = false
end

local function format_async()
  vim.lsp.buf.format { async = true }
end

function M.map_formatting()
  local fmt = is_prerelease and format_async or vim.lsp.buf.formatting

  require('crows').key.maps({
    ['<Leader>'] = {
      f = { fmt, 'Format' },
    },
  }, {})
end

return M
