local map = vim.keymap.set

vim.cmd [[command! BreakpointToggle lua require('dap').toggle_breakpoint()]]
vim.cmd [[command! Debug lua require('dap').continue()]]
vim.cmd [[command! DapREPL lua require('dap').repl.open()]]

map('n', '<F5>', [[<cmd>lua require('dap').continue()<cr>]])
map('n', '<F10>', [[<cmd>lua require('dap').step_over()<cr>]])
map('n', '<F11>', [[<cmd>lua require('dap').step_into()<cr>]])
map('n', '<F12>', [[<cmd>lua require('dap').step_out()<cr>]])
