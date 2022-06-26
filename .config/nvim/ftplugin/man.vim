" Avoid remapping of j and k
g:no_man_maps = 1

setlocal signcolumn=no

augroup MyFiletypeMan
    autocmd!
    autocmd FileType man
                \ nnoremap <buffer> <silent> gO <Cmd>call man#show_toc()<CR> |
                \ nnoremap <buffer> <silent> <2-LeftMouse> <Cmd>Man<CR> |
                \ nnoremap <buffer> <silent> <nowait> q <Cmd>lclose<CR><C-W>c
augroup END

nnoremap <buffer> g/ /\C^\s*\zs
nnoremap <buffer> g? ?\C^\s*\zs
