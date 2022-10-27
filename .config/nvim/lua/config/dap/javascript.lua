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
    -- trace = true, -- include debugger info
    runtimeExecutable = 'node',
    runtimeArgs = {
      './node_modules/jest/bin/jest.js',
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
