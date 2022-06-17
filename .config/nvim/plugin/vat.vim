xnoremap @ :<C-U>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo '@' . getcmdline()
  execute ":'<,'>normal @" . nr2char(getchar())
endfunction
