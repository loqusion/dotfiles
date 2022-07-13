-- https://github.com/mfussenegger/nvim-dap

local M = {
  safe_requires = {
    'dap',
  },
}

function M.setup()
  M.register_global_keys()
  vim.api.nvim_create_user_command('BreakpointToggle', 'lua require("dap").toggle_breakpoint()', {})
  vim.api.nvim_create_user_command('Debug', 'lua require("dap").continue()', {})
  vim.api.nvim_create_user_command('DapREPL', 'lua require("dap").repl.open()', {})
end

function M.config()
  M.dap.adapters.nlua = function(callback, config)
    callback { type = 'server', host = config.host, port = config.port }
  end

  M.dap.configurations.lua = {
    {
      type = 'nlua',
      request = 'attach',
      name = 'Attach to running Neovim instance',
      host = function()
        local value = vim.fn.input 'Host [127.0.0.1]: '
        if value ~= '' then
          return value
        end
        return '127.0.0.1'
      end,
      port = function()
        local val = tonumber(vim.fn.input 'Port: ')
        assert(val, 'Please provide a port number')
        return val
      end,
    },
  }

  -- lldb
  M.dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb',
  }

  M.dap.configurations.cpp = {
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

  M.dap.configurations.c = M.dap.configurations.cpp
  M.dap.configurations.rust = M.dap.configurations.cpp
end

function M.register_global_keys()
  require('crows').key.maps {
    ['<F5>'] = { '<Cmd>lua require("dap").continue()<CR>', 'Debug: Continue' },
    ['<F10>'] = { '<Cmd>lua require("dap").step_over()<CR>', 'Debug: Step over' },
    ['<F11>'] = { '<Cmd>lua require("dap").step_into()<CR>', 'Debug: Step into' },
    ['<F12>'] = { '<Cmd>lua require("dap").step_out()<CR>', 'Debug: Step out' },
    ['<Leader>'] = {
      b = {
        b = { '<Cmd>lua require("dap").toggle_breakpoint()<CR>', 'Toggle breakpoint' },
        c = {
          '<Cmd>lua require("dap").toggle_breakpoint(vim.fn.input("Condition: "))<CR>',
          'Set conditional breakpoint',
        },
      },
    },
  }
end

return M
