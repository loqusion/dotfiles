local M = {}

function M.get_listed(opts)
  opts = vim.tbl_extend('keep', opts or {}, {
    ignore_current_buffer = false,
  })

  local bufnrs = vim.tbl_filter(function(b)
    if vim.fn.buflisted(b) ~= 1 then
      return false
    end
    if opts.ignore_current_buffer and b == vim.api.nvim_get_current_buf() then
      return false
    end
  end, vim.api.nvim_list_bufs())

  return bufnrs
end

local function delete_current_buffer_if_listed()
  local current_buf = vim.api.nvim_get_current_buf()
  if vim.fn.buflisted(current_buf) == 1 then
    vim.api.nvim_buf_delete(current_buf, {})
  end
end

function M.delete_listed()
  local bufnrs = M.get_listed { ignore_current_buffer = true }
  for _, bufnr in ipairs(bufnrs) do
    vim.api.nvim_buf_delete(bufnr, {})
  end
  delete_current_buffer_if_listed()
end

return M
