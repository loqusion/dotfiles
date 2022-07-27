local lazy = require 'crows.lazy'

local configs = {
  jest = {
    name = 'Jest',
    type = 'node2',
    request = 'launch',
    args = { '--no-cache' },
    runtimeArgs = { '--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file' },
    cwd = '${workspaceFolder}',
    sourceMaps = 'inline',
    protocol = 'inspector',
    console = 'integratedTerminal',
    port = 9229,
    disableOptimimisticBPs = true,
  },
  node_launch = {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    -- cwd = '${workspaceFolder}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    restart = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  node_launch2 = {
    type = 'node-terminal',
    request = 'launch',
    name = 'launchv2',
    program = '${file}',
  },
  node_attach = {
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = lazy.fn('dap.utils', 'pick_process'),
  },
}

return {}

-- return {
--   adapters = {
--     node2 = {
--       type = 'executable',
--       command = 'node',
--       args = { vim.env.HOME .. '/.local/share/vscode-node-debug2/out/src/nodeDebug.js' },
--     },
--   },
--   configurations = {
--     javascript = {
--       configs.jest,
--       configs.node_launch,
--       configs.node_attach,
--     },
--     typescript = {
--       configs.jest,
--       configs.node_launch,
--       configs.node_attach,
--     },
--   },
-- }
