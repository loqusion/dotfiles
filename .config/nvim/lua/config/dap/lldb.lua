local lldb_config = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

return {
  adapters = {
    lldb = {
      type = 'executable',
      command = '/usr/bin/lldb-vscode',
      name = 'lldb',
    },
  },
  configurations = {
    c = lldb_config,
    cpp = lldb_config,
    rust = lldb_config,
  },
}
