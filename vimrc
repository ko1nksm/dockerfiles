set t_u7= 
set t_RV=
set modeline
set tabstop=2
set number
set cursorline
set backspace=indent,eol,start
set ruler
set laststatus=2
set title
set list
set listchars=eol:⏎,tab:⇨･
highlight NonText ctermfg=240
highlight SpecialKey ctermfg=240
autocmd BufRead,BufNewFile profile set filetype=sh
autocmd BufRead,BufNewFile bash_profile,bashrc,bash_login,bash_logout set filetype=bash
