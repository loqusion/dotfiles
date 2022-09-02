-- https://github.com/mfussenegger/nvim-dap
local api = require 'utils.api'

local M = {
  safe_requires = {
    'dap',
  },
  dap_root_directory = api.path.join(vim.fn.stdpath 'config', 'lua', 'config', 'dap'),
}

function M.setup()
  M.register_global_keys()
  vim.api.nvim_create_user_command(
    'DapBreakpoints',
    'lua require("dap").list_breakpoints(true)',
    { desc = 'Debug: List breakpoints', nargs = 0 }
  )
  vim.api.nvim_create_user_command(
    'DapClearBreakpoints',
    'lua require("dap").clear_breakpoints()',
    { desc = 'Debug: Clear breakpoints', nargs = 0 }
  )
  vim.api.nvim_create_user_command(
    'DapLuaServer',
    string.format('lua require("osv").launch({ port = %s })', require('config.dap.lua').port),
    { desc = 'Debug: Start Lua debug adapter', nargs = 0 }
  )
end

function M.config()
  local dap_configs = api.path.require_recursive 'config.dap'
  for _, dap_config in pairs(dap_configs) do
    if dap_config.adapters then
      M.dap.adapters = vim.tbl_deep_extend('force', M.dap.adapters, dap_config.adapters)
    end
    if dap_config.configurations then
      M.dap.configurations = vim.tbl_deep_extend('force', M.dap.configurations, dap_config.configurations)
    end
  end
end

function M.register_global_keys()
  local lazy = require 'crows.lazy'

  require('crows').key.maps {
    ['<F5>'] = { '<Cmd>lua require("dap").continue()<CR>', 'Debug: Continue' },
    ['<F17>'] = { -- <S-F5>
      '<Cmd>lua require("dap").terminate()<CR>',
      'Debug: Stop <S-F5>',
    },
    ['<F6>'] = { '<Cmd>lua require("dap").pause()<CR>', 'Debug: Pause' },
    ['<F9>'] = { '<Cmd>lua require("dap").toggle_breakpoint()<CR>', 'Debug: Toggle breakpoint' },
    ['<F21>'] = { -- <S-F9>
      '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Condition: "))<CR>',
      'Debug: Set conditional breakpoint <S-F9>',
    },
    ['<F10>'] = { '<Cmd>lua require("dap").step_over()<CR>', 'Debug: Step over' },
    ['<F11>'] = { '<Cmd>lua require("dap").step_into()<CR>', 'Debug: Step into' },
    ['<F23>'] = { -- <S-F11>
      '<Cmd>lua require("dap").step_out()<CR>',
      'Debug: Step out <S-F11>',
    },
    ['<Leader>'] = {
      d = {
        r = { lazy.fn('dap', 'repl.toggle', { height = 15 }), 'Debug: Toggle REPL' },
        l = { lazy.fn('dap', 'run_last'), 'Debug: Re-run last debug adapter/configuration' },
        j = { lazy.fn('dap', 'down'), 'Debug: Down in current stacktrace without stepping' },
        k = { lazy.fn('dap', 'up'), 'Debug: Up in current stacktrace without stepping' },
        c = { lazy.fn('dap', 'run_to_cursor'), 'Debug: Continue execution to cursor position' },
      },
      b = { lazy.fn('dap', 'toggle_breakpoint'), 'Debug: Toggle breakpoint' },
      B = {
        '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint Condition: "))<CR>',
        'Debug: Set conditional breakpoint',
      },
    },
  }
end

return M
