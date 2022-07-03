-- https://github.com/wellle/targets.vim

local M = {}

function M.entrance()
  vim.api.nvim_create_autocmd('User', {
    pattern = 'targets#mappings#user',
    callback = M.unmap,
  })
end

function M.unmap()
  vim.cmd [[
    call targets#mappings#extend({
      \ ';': {},
      \ })
  ]]
end

return M
