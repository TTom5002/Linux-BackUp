" Set compatibility to Vim only
set nocompatible

" Do not create backup files
set nobackup nowritebackup

" Set syntax on
syntax on

" Automaticallz wrap text that extends beyond the screen length
set wrap

" Encoding
set encoding=utf-8

" Show hybrid line number
set number relativenumber

" More powerfull backspacing
set backspace=indent,eol,start

" Show current line number at bottom right of the screen
set ruler

" Command-line completion
set wildmenu

" Different cursors
let &t_EI = "\033[2 q" "Normal mode
let &t_SI = "\033[5 q" "Insert mode

" Tab to spaces
set expandtab tabstop=2 shiftwidth=2

