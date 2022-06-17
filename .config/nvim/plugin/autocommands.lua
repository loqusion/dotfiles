vim.cmd [[
  augroup MyAutoCmd
    autocmd!

    " For only Vim help files.
    autocmd BufRead,BufWritePost *.txt
    \ setlocal modelines=2 modeline colorcolumn= foldcolumn=0 signcolumn=no

    " Disable unnecessary features in man pages.
    autocmd FileType man setlocal signcolumn=no

    " Disable paste.
    autocmd InsertLeave *
    \ if &paste | setlocal nopaste | setlocal paste? | endif |
    \ if &l:diff | diffupdate | endif

    " hl-QuickFixLine doesn't play nicely with listchars.
    autocmd FileType qf setlocal nolist

    " Make directory automatically.
    " --------------------------------------
    " http://vim-users.jp/2011/02/hack202/
    autocmd MyAutoCmd BufWritePre *
    \ call MkdirAsNecessary(expand('<afile>:p:h'), v:cmdbang)
    function! MkdirAsNecessary(dir, force) abort
      if !isdirectory(a:dir) && &l:buftype ==# '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
      endif
    endfunction

    " Trim unnecessary whitespace.
    autocmd MyAutoCmd BufWritePre *
    \ call vimrc#trim_trailing_whitespace() |
    \ call vimrc#trim_final_newlines()
  augroup END
]]
