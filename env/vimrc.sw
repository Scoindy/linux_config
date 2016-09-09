set nocompatible
set columns=128
set lines=48
set showmatch     
set showmode      
set report=1      
set noerrorbells  
set flash         
set ignorecase
set incsearch
set directory=.,$TEMP
set backupdir=$TEMP
set backspace=indent,eol,start
set ruler
set laststatus=2

syntax off
colorscheme swg_blue001
inoremap <C-U> <C-G>u<C-U>

map V 02i j0    
map v 02xj2h      
map K 0i# j0    
map  0i-- j0   
