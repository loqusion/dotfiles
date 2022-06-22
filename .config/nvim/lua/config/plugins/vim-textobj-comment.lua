-- https://github.com/glts/vim-textobj-comment

local M = {}

function M.entrance()
  vim.g.textobj_comment_no_default_key_mappings = 1
  M.register_global_keys()
end

function M.register_global_keys()
  require('crows').key.maps({
    ['ac'] = { '<Plug>(textobj-comment-a)', 'a comment' },
    ['ic'] = { '<Plug>(textobj-comment-i)', 'in comment' },
  }, { mode = 'o' })
end

return M
