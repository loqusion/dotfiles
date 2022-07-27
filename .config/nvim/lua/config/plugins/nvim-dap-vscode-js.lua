-- https://github.com/mxsdev/nvim-dap-vscode-js

local M = {
  safe_requires = {
    { 'dap-vscode-js', 'dap_vscode_js' },
    'dap',
    { 'dap.utils', 'dap_utils' },
  },
}

function M.setup() end

function M.config()
  M.dap_vscode_js.setup {
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
  }
end

return M
