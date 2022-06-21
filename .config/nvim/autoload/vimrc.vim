"---------------------------------------------------------------------------
" vimrc functions:
"

function! vimrc#toggle_option(option_name) abort
  if a:option_name ==# 'laststatus'
    if &laststatus == 0
      silent setlocal laststatus=3
    else
      silent setlocal laststatus=0
    endif
  else
    execute 'silent setlocal' a:option_name.'!'
    execute 'setlocal' a:option_name.'?'
  endif
endfunction

function! vimrc#on_filetype() abort
  if execute('filetype') !~# 'OFF'
    if !exists('b:did_ftplugin')
      runtime! after/ftplugin.vim
    endif

    return
  endif

  filetype plugin indent on
  syntax enable

  " Note: filetype detect does not work on startup
  filetype detect
endfunction

function! vimrc#enable_syntax() abort
  syntax enable

  if has('nvim') && exists(':TSEnableAll')
    TSBufEnable highlight
    TSBufEnable context_commentstring
  endif
endfunction
function! vimrc#disable_syntax() abort
  if &l:syntax !=# ''
    syntax off
  endif

  if has('nvim') && exists(':TSEnableAll')
    TSBufDisable highlight
    TSBufDisable context_commentstring
  endif
endfunction

function! vimrc#diagnostics_to_qf() abort
  if !has('nvim')
    return
  endif

  let qflist = []
  for diagnostic in v:lua.vim.diagnostic.get()
    call add(qflist, {
          \ 'bufnr': diagnostic.bufnr,
          \ 'lnum': diagnostic.lnum,
          \ 'col': diagnostic.col,
          \ 'text': diagnostic.message,
          \ })
  endfor

  if !empty(qflist)
    call setqflist(qflist)
    copen
  endif
endfunction

" Get the last selected text in visual mode
" without using |gv| to avoid |textlock|.
" NOTE:
" * This function uses |gv| only when using |CTRL-V|
"   because |gv| is the only way to get selected text
"   when using <C-v>$ .
"   Please see #192 for the details.
" * If you don't care about |textlock|,
"   you can use simple version of this function.
"   https://github.com/vim-jp/vital.vim/commit/39aae80f3839fdbeebd838ff14d87327a6b889a9
function! vimrc#get_last_selected() abort
  if visualmode() ==# "\<C-v>"
    let save = getreg('"', 1)
    let save_type = getregtype('"')
    try
      normal! gv""y
      return @"
    finally
      call setreg('"', save, save_type)
    endtry
  else
    let [begin, end] = [getpos("'<"), getpos("'>")]
    let lastchar = matchstr(getline(end[1])[end[2]-1 :], '.')
    if begin[1] ==# end[1]
      let lines = [getline(begin[1])[begin[2]-1 : end[2]-2]]
    else
      let lines = [getline(begin[1])[begin[2]-1 :]]
      \         + (end[1] - begin[1] <# 2 ? [] : getline(begin[1]+1, end[1]-1))
      \         + [getline(end[1])[: end[2]-2]]
    endif
    return join(lines, "\n") . lastchar . (visualmode() ==# 'V' ? "\n" : '')
  endif
endfunction

function! vimrc#get_in_quotes() abort
  let save = getreg('"')
  let save_type = getregtype('"')
  let [_; save_cursor] = getcurpos()
  try
    call setreg('"', '')
    normal! ""yi'
    let s1 = @"
    call cursor(save_cursor)
    call setreg('"', '')
    normal! ""yi"
    let s2 = @"
    let len1 = strlen(s1)
    let len2 = strlen(s2)
    return (len1 != 0 && (len2 == 0 || len1 < len2)) ? s1 : s2
  finally
    call setreg('"', save, save_type)
    call cursor(save_cursor)
  endtry
endfunction

" https://github.com/editorconfig/editorconfig-vim/blob/a8e3e66deefb6122f476c27cee505aaae93f7109/plugin/editorconfig.vim#L501
function! vimrc#trim_trailing_whitespace()
  if &l:modifiable
    " don't lose user position when trimming trailing whitespace
    let s:view = winsaveview()
    try
      silent! keeppatterns keepjumps %s/\s\+$//e
    finally
      call winrestview(s:view)
    endtry
  endif
endfunction

function! vimrc#trim_final_newlines()
  if &l:modifiable
    let s:view = winsaveview()
    try
      " can use \_s instead of \n to handle spaces/tabs as well
      silent! keeppatterns keepjumps %s/\n\+\%$//e
    finally
      call winrestview(s:view)
    endtry
  endif
endfunction

function! vimrc#get_github_owner_repo(mode)
  let selected = expand('<cfile>')
  let col = getcurpos()[2]
  if match(selected, '\c^[a-z0-9_.-]\+/[a-z0-9_.-]\+$') != -1 &&
        \ (a:mode ==# 'v' || (
        \ match(getline('.'), selected) <= col &&
        \ matchend(getline('.'), selected) >= col - 1))
    return 'https://github.com/' . selected
  endif
  return ''
endfunction

" If hovering/selecting owner/repo, treat it as a github url
function! vimrc#github_or_open_browser(mode)
  let github_uri = vimrc#get_github_owner_repo(a:mode)
  if !empty(github_uri)
    call openbrowser#open(github_uri)
  else
    call openbrowser#_keymap_smart_search(a:mode)
  endif
endfunction
