hi clear
if exists('syntax_on')
  syntax reset
endif

runtime colors/space_vim_theme.vim

let g:colors_name = 'space_vim_theme_improved'

hi Comment  guifg=#5C6370 ctermfg=59
hi link QuickFixLine CursorLine

if get(g:, 'space_vim_transp_bg')
  hi GitGutterAdd guibg=NONE ctermbg=NONE
  hi GitGutterChange guibg=NONE ctermbg=NONE
  hi GitGutterDelete guibg=NONE ctermbg=NONE
  hi GitGutterChangeDelete guibg=NONE ctermbg=NONE
  hi link NotifyERRORBody Normal
  hi link NotifyWARNBody Normal
  hi link NotifyINFOBody Normal
  hi link NotifyDEBUGBody Normal
  hi link NotifyTRACEBody Normal
endif
