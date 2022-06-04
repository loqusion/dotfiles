require('zen-mode').setup {
  on_open = function()
    vim.cmd [[
      augroup ZenMode
        au!
        autocmd ExitPre * lua require('zen-mode').close()
      augroup END
    ]]
  end,
  on_close = function()
    vim.cmd [[ au! ZenMode ]]
  end,
}
