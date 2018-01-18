" gVim colour file : swg_blue001
" Scott Walkinshaw 27th November 2002
" minimal white on blue with yellow accent- no syntax highlighting

set t_Co=256
let g:colors_name = expand('<sfile>:t:r')

"  guifg = text
"  guibg = backgroundf
"  guisp = underlined
"
"  colours:
"     #EB984E	orange 
"     #DB741F   also orange, slightly darker. I must have been high....
"     #FFCC00   yellow
"     #2ECC71   green
"
"  
hi Normal       guifg=#FFFFFF guibg=#0000FF guisp=#FFCC00 gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi ErrorMsg     guibg=Red guifg=White
hi WarningMsg   guifg=#EB984E
hi StatusLine   guifg=#FFCC00 guibg=#0000FF guisp=#DB741F gui=underline ctermfg=254 ctermbg=166 cterm=underline
hi StatusLineNC guifg=#FFCC00 guibg=#0000FF guisp=#DB741F gui=underline ctermfg=254 ctermbg=166 cterm=underline
hi Cursor       guibg=#FFCC00 guifg=NONE
hi lCursor      guibg=#FFCC00 guifg=NONE
hi Search       guifg=#2ECC71 guibg=NONE
hi IncSearch    guifg=#2ECC71 guibg=NONE
hi NonText      guifg=#FFCC00 " guibg=#000038 guisp=#000038 gui=NONE ctermfg=NONE ctermbg=17 cterm=NONE
hi Visual       guibg=#EB984E
