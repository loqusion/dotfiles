local M = {}

function M.augroup(name)
  return vim.api.nvim_create_augroup("loqusion_" .. name, { clear = false })
end

return M
