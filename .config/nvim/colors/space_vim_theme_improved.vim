hi clear
if exists('syntax_on')
  syntax reset
endif

runtime colors/space_vim_theme.vim

let g:colors_name = 'space_vim_theme_improved'

hi Comment  guifg=#5C6370 ctermfg=59

hi NotifyERRORBorder guibg=NONE ctermbg=NONE
hi NotifyWARNBorder guibg=NONE ctermbg=NONE
hi NotifyINFOBorder guibg=NONE ctermbg=NONE
hi NotifyDEBUGBorder guibg=NONE ctermbg=NONE
hi NotifyTRACEBorder guibg=NONE ctermbg=NONE
hi NotifyERRORIcon guibg=NONE ctermbg=NONE
hi NotifyWARNIcon guibg=NONE ctermbg=NONE
hi NotifyINFOIcon guibg=NONE ctermbg=NONE
hi NotifyDEBUGIcon guibg=NONE ctermbg=NONE
hi NotifyTRACEIcon guibg=NONE ctermbg=NONE
hi NotifyERRORTitle  guibg=NONE ctermbg=NONE
hi NotifyWARNTitle guibg=NONE ctermbg=NONE
hi NotifyINFOTitle guibg=NONE ctermbg=NONE
hi NotifyDEBUGTitle  guibg=NONE ctermbg=NONE
hi NotifyTRACETitle  guibg=NONE ctermbg=NONE
hi link NotifyERRORBody Normal
hi link NotifyWARNBody Normal
hi link NotifyINFOBody Normal
hi link NotifyDEBUGBody Normal
hi link NotifyTRACEBody Normal
