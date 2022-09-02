-- https://github.com/cedarbaum/fugitive-azure-devops.vim
local options = require 'core.options'

local M = {}

function M.entrance()
  vim.g.fugitive_azure_devops_baseurl = options.company.git_url
end

return M
