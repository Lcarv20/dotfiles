" ==================================================================================
"   Gemini - A minimal dark theme with cyan accents
"   Author: lcarv
"   License: MIT
" ==================================================================================

set bg=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

" UI Elements
hi Normal           guifg=#e4e4ef guibg=#181818           ctermfg=254 ctermbg=234
hi ErrorMsg         guifg=#ed0543 guibg=NONE              ctermfg=197 ctermbg=NONE
hi NormalFloat     guifg=#e4e4ef guibg=#181818           ctermfg=254 ctermbg=234
hi Visual           guifg=NONE    guibg=#094857           ctermfg=NONE ctermbg=23
hi Search           guifg=#181818 guibg=#7ee0c8           ctermfg=234 ctermbg=116
hi IncSearch        guifg=#181818 guibg=#7ee0c8           ctermfg=234 ctermbg=116

hi SpecialKey      guifg=#64666d                          ctermfg=242
hi Directory       guifg=#e05c72                          ctermfg=167
hi Title           guifg=#7ee0c8 gui=NONE                 ctermfg=116 cterm=NONE
hi WarningMsg      guifg=#c40a13                          ctermfg=160
hi ModeMsg         guifg=#7ee0c8                          ctermfg=116
hi MoreMsg         guifg=#7ee0c8                          ctermfg=116
hi Question        guifg=#7ee0c8 gui=NONE                 ctermfg=116 cterm=NONE
hi NonText         guifg=#64666d                          ctermfg=242

" UI Borders and Status
hi StatusLine      guifg=#e4e4ef guibg=#282828 gui=NONE  ctermfg=254 ctermbg=235 cterm=NONE
hi StatusLineNC    guifg=#64666d guibg=#282828 gui=NONE  ctermfg=242 ctermbg=235 cterm=NONE
hi VertSplit       guifg=#282828 guibg=NONE    gui=NONE  ctermfg=235 ctermbg=NONE cterm=NONE
hi LineNr          guifg=#64666d                          ctermfg=242

" Code Folding
hi Folded          guifg=#db9ec8 guibg=#282828           ctermfg=175 ctermbg=235
hi FoldColumn      guifg=#db9ec8 guibg=#282828           ctermfg=175 ctermbg=235

" Diff
hi DiffAdd         guifg=#7ee0c8 guibg=#2d3a3a           ctermfg=116 ctermbg=237
hi DiffChange      guifg=#cc8c3c guibg=#2d3a3a           ctermfg=172 ctermbg=237
hi DiffDelete      guifg=#c40a13 guibg=#3a2d2d           ctermfg=160 ctermbg=236
hi DiffText        guifg=#7ee0c8 guibg=#2d3a3a           ctermfg=116 ctermbg=237

" Cursor
hi Cursor          guifg=#181818 guibg=#e4e4ef           ctermfg=234 ctermbg=254
hi CursorLine      guibg=#282828                         ctermbg=235
hi CursorLineNr    guifg=#7ee0c8 guibg=NONE              ctermfg=116 ctermbg=NONE

" Syntax Highlighting
hi Comment         guifg=#8f7253                          ctermfg=94
hi Constant        guifg=#fff                            ctermfg=231
hi String          guifg=#eb7644                         ctermfg=173
hi Character       guifg=#cc8c3c                          ctermfg=172
hi Number          guifg=#fff                            ctermfg=231
hi Boolean         guifg=#7ee0c8 gui=bold                ctermfg=116
hi Float           guifg=#fff                            ctermfg=231

hi Identifier      guifg=#fff                            ctermfg=231
hi Function        guifg=#94a6a5 gui=bold                ctermfg=109 cterm=bold 

hi Statement       guifg=#fff                            ctermfg=231
hi Conditional     guifg=#fff                            ctermfg=231
hi Repeat          guifg=#fff                            ctermfg=231
hi Label           guifg=#fff                            ctermfg=231
hi Operator        guifg=#e4e4ef                          ctermfg=254
hi Keyword         guifg=#7ee0c8 gui=italic,bold         ctermfg=116

hi PreProc         guifg=#fff                            ctermfg=231
hi Type            guifg=#aea0b8 gui=bold                ctermfg=146
hi Special         guifg=#fff                            ctermfg=231
hi Underlined      gui=underline                          cterm=underline
hi Todo            guifg=#8fceeb guibg=NONE gui=bold     ctermfg=117 ctermbg=NONE cterm=bold
hi Error           guifg=#c40a13 guibg=NONE              ctermfg=160 ctermbg=NONE

" Diagnostic
hi DiagnosticUnderlineError  gui=undercurl ctermfg=81 ctermbg=NONE
hi DiagnosticUnnecessary gui=undercurl ctermfg=81 ctermbg=NONE
