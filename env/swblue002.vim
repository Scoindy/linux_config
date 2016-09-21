" Vim colour file : swblue002
" Scott Walkinshaw 27th November 2002
" minimal colourset; darker than swblue001

"set t_Co=256
"let g:colors_name = expand('<sfile>:t:r')

"  guifg = text
"  guibg = backgroundf
"  guisp = underlined
"
"  colours:
"     #C78420   dark orange
"     #000050   dark blue
"     #D9D9D0   off white text
"     #D7D75F   yellow cursor
"  
hi Normal        guibg=#000050 guifg=#D9D9D0 guisp=#FFFFC2
hi ErrorMsg      guibg=#C00000 guifg=#E2E4E5
hi WarningMsg    guibg=#000050 guifg=#C78420
hi StatusLine    guibg=#C78420 guifg=#000050 
hi StatusLineNC  guibg=#000050 guifg=#C78420  guisp=#C78420
"hi StatusLineNC  guibg=#C78420 guifg=#000050 
hi Cursor        guibg=#D7D75F guifg=NONE
hi lCursor       guibg=#D7D75F guifg=NONE
hi Search        guibg=#000050 guifg=#C9C916 guisp=#FFCC00
hi NonText       guibg=#000050 guifg=#0000C0
hi ModeMess      guibg=#000050 guifg=#FFFFFF
hi Visual        guibg=#D9D9D0 guifg=#000050
