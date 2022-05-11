function! Redir(cmd, rng, start, end)
  for win in range(1, winnr('$'))
    if getwinvar(win, 'scratch')
      execute win . 'windo close'
    endif
  endfor

  if a:cmd =~ '^!'
    let cmd = (
          \ a:cmd =~ ' %'
          \ ? a:cmd->substitute(
          \     ' %',
          \     ' ' . expand('%:p')->fnameescape()->shellescape(),
          \     '')
          \ : a:cmd)->matchstr('^!\zs.*')
    if a:rng == 0
      let output = systemlist(cmd)
    else
      let joined_lines = getline(a:start, a:end)->join('\n')
      let cleaned_lines = joined_lines->shellescape()
            \                         ->substitute("'\\\\''", "\\\\'", 'g')
      let output = systemlist(cmd . " <<< $" . cleaned_lines)
    endif
  else
    redir => output
    execute a:cmd
    redir END
    let output = output->split('\n')
  endif

  new
  let w:scratch = 1
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
  call setline(1, output)
endfunction

" This command definition includes -bar, so that it is possible to "chain"
" Vim commands.
" Side effect: double quotes can't be used in external commands
command! -nargs=1 -complete=command -bar -range Redir
      \ silent call Redir(<q-args>, <range>, <line1>, <line2>)

" This command definition doesn't include -bar, so that it is possible to
" use double quotes in external commands.
" Side effect: Vim commands can't be "chained".
"command! -nargs=1 -complete=command -range Redir
"      \ silent call Redir(<q-args>, <range>, <line1>, <line2>)
