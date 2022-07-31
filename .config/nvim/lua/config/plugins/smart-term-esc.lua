-- https://github.com/sychen52/smart-term-esc.nvim

local M = {
  safe_requires = {
    { 'smart-term-esc', 'smart_term_esc' },
  },
}

function M.setup() end

function M.config()
  M.smart_term_esc.setup {
    except = { 'nvim', 'fzf', 'lazygit' },
  }
end

return M
