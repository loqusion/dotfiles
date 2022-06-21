-- https://github.com/windwp/nvim-autopairs

local M = {}

function M.setup() end

function M.config()
  require('nvim-autopairs').setup {
    fast_wrap = {},
    enable_check_bracket_line = true,
    check_ts = true,
  }
  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  local cmp = require 'cmp'
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
end

return M
