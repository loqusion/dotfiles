-- https://github.com/windwp/nvim-autopairs

local M = {
  safe_requires = {
    { 'nvim-autopairs', 'autopairs' },
    { 'nvim-autopairs.completion.cmp', 'cmp_autopairs' },
    'cmp',
  },
}

function M.setup() end

function M.config()
  M.autopairs.setup {
    fast_wrap = {},
    enable_check_bracket_line = true,
    check_ts = true,
  }
  -- If you want insert `(` after select function or method item
  M.cmp.event:on('confirm_done', M.cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
end

return M
