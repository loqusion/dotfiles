xnoremap @ <cmd>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo '@' . getcmdline()
  execute ":'<,'>normal! @" . nr2char(getchar())
endfunction
