pcall(require, 'impatient')

-- Some features are disabled if I open neovim in a neovim terminal
if vim.env.NVIM_IS_PARENT_OPEN then
  vim.env.NVIM_IS_CHILD_PROCESS = true
else
  vim.env.NVIM_IS_PARENT_OPEN = true
  vim.env.NVIM_IS_CHILD_PROCESS = false
end

require 'core.options'
require 'core.settings'
require 'core.mappings'
require 'core.autocmds'
require 'core.plugins'
require 'core.after'
