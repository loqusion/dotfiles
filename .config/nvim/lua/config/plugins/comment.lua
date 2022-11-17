-- https://github.com/numToStr/Comment.nvim

local M = {
  safe_requires = {
    'Comment',
  },
}

function M.config()
  local pre_hook = M.ts_context_commentstring_integration_hook()

  M.Comment.setup {
    pre_hook = pre_hook,
  }
end

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#commentnvim
function M.ts_context_commentstring_integration_hook()
  local pre_hook
  local ok, t = pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
  if ok then
    pre_hook = t.create_pre_hook()
  end
  return pre_hook
end

return M
