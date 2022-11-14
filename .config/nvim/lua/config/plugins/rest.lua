-- https://github.com/NTBBloodbath/rest.nvim

local M = {
  safe_requires = {
    { 'rest-nvim', 'rest' },
  },
}

function M.setup() end

function M.config()
  M.rest.setup {}
  M.register_filetype_autocmds()
end

function M.register_filetype_autocmds()
  local group = vim.api.nvim_create_augroup('http_custom', {})
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'http',
    callback = function(props)
      M.register_buffer_keys(props.buf)
    end,
    group = group,
  })
end

function M.register_buffer_keys(bufnr)
  require('crows').key.maps({
    ['<CR>'] = { '<Plug>RestNvim', 'Rest Nvim' },
  }, { buffer = bufnr })
end

return M
