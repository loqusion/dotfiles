-- https://github.com/folke/todo-comments.nvim

local M = {
  safe_requires = {
    { 'todo-comments', 'todo_comments' },
  },
}

function M.setup() end

function M.config()
  M.todo_comments.setup {}
end

return M
