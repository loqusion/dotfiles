function! Retab(...)
  let winview = winsaveview()
  let save_equalprg = &l:equalprg
  setlocal equalprg=

  if a:0 && type(a:1) == v:t_number && a:1 != 0
    let width = a:1
    if &l:shiftwidth == 0
      let &l:tabstop = width
    else
      let &l:shiftwidth = width
    endif
  endif
  normal! gg=G

  let &l:equalprg = save_equalprg
  call winrestview(winview)
endfunction
command! -count Retab call Retab(<count>)
