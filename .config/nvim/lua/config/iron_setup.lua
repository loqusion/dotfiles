local map = vim.keymap.set

-- copied from https://github.com/hkupty/iron.nvim/blob/89f0c3fdcf09243739dcfc400542bd6e79319d9d/lua/iron/core.lua#L441
-- requires are wrapped in functions for lazy loading
local core = {
  -- basic interactions with the repl
  send_motion = function() require('iron.core').run_motion('send_motion') end,
  repeat_cmd = function() require('iron.core').repeat_cmd() end,
  send_line = function() require('iron.core').send_line() end,
  visual_send = function() require('iron.core').visual_send() end,

  -- Force clear highlight
  clear_hl = function() require('iron.marks').clear_hl() end,

  -- Sending special characters to the repl
  cr = function() require('iron.core').send(nil, string.char(13)) end,
  interrupt = function() require('iron.core').send(nil, string.char(03)) end,
  exit = function() require('iron.core').close_repl() end,
  clear = function() require('iron.core').send(nil, string.char(12)) end,
}

map('n', '[Space]sc', core.send_motion, { silent = true })
map('x', '[Space]sc', core.visual_send, { silent = true })
map('n', '[Space]sl', core.send_line, { silent = true })
map('n', '[Space]s.', core.repeat_cmd, { silent = true })
map('n', '[Space]s<CR>', core.cr, { silent = true })
map('n', '[Space]s[Space]', core.interrupt, { silent = true })
map('n', '[Space]sq', core.exit, { silent = true })
map('n', '[Space]cl', core.clear, { silent = true })
