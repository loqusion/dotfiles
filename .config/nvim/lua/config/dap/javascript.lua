local lazy = require 'utils.api.lazy'

local configs = {
  node_launch = {
    name = 'Launch file',
    type = 'pwa-node',
    request = 'launch',
    program = '${file}',
    cwd = '${workspaceFolder}',
  },
  node_attach = {
    name = 'Attach',
    type = 'pwa-node',
    request = 'attach',
    processId = lazy.fn('dap.utils', 'pick_process'),
    cwd = '${workspaceFolder}',
  },
  jest = {
    name = 'Jest',
    type = 'pwa-node',
    request = 'launch',
    runtimeExecutable = '${workspaceFolder}/node_modules/.bin/jest',
    runtimeArgs = {
      '--runInBand',
    },
    rootPath = '${workspaceFolder}',
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
  },
}

return {
  adapters = {},
  configurations = {
    javascript = {
      configs.node_launch,
      configs.node_attach,
      configs.jest,
    },
    typescript = {
      configs.node_launch,
      configs.node_attach,
      configs.jest,
    },
  },
}
