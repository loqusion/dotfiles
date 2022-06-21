-- https://github.com/mfussenegger/nvim-dap

local M = {}

function M.setup()
  vim.api.nvim_create_user_command('BreakpointToggle', 'lua require("dap").toggle_breakpoint()', {})
  vim.api.nvim_create_user_command('Debug', 'lua require("dap").continue()', {})
  vim.api.nvim_create_user_command('DapREPL', 'lua require("dap").repl.open()', {})
  require('crows').key.maps {
    ['<F5>'] = { '<cmd>lua require("dap").continue()', 'Debug: Continue' },
    ['<F10>'] = { '<cmd>lua require("dap").step_over()', 'Debug: Step over' },
    ['<F11>'] = { '<cmd>lua require("dap").step_into()', 'Debug: Step into' },
    ['<F12>'] = { '<cmd>lua require("dap").step_out()', 'Debug: Step out' },
  }
end

function M.config()
  local dap = require 'dap'

  dap.adapters.nlua = function(callback, config)
    callback { type = 'server', host = config.host, port = config.port }
  end

  dap.configurations.lua = {
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
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb',
  }

  dap.configurations.cpp = {
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

  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
end

return M
