local M = {}

function M.disable_formatting(client, _)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

return M
