function! Retab(...)
  let save_equalprg = &l:equalprg
  setlocal equalprg=

  if a:0 && type(a:1) == v:t_number && a:1 != 0
    let width = a:1
    let &l:tabstop = width
    if &l:shiftwidth != 0
      let &l:shiftwidth = width
    endif
  endif
  normal! gg=G

  let &l:equalprg = save_equalprg
endfunction
command! -count Retab call Retab(<count>)
