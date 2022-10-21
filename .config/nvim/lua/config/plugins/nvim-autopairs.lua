-- https://github.com/windwp/nvim-autopairs

local M = {
  safe_requires = {
    { 'nvim-autopairs', 'autopairs' },
  },
}

function M.setup() end

function M.config()
  M.autopairs.setup {
    fast_wrap = {},
    enable_check_bracket_line = true,
    check_ts = true,
  }
end

function M.cmp_integration()
  require('cmp').event:on(
    'confirm_done',
    require('nvim-autopairs.completion.cmp').on_confirm_done {
      filetypes = {
        tex = false,
      },
    }
  )
end

return M
