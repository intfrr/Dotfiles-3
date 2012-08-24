" Config
call pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
" set nowrap
let mapleader = ','

" Makes the OS X clipboard work
set clipboard=unnamed

" Line breaks only happen on words
set linebreak

" Show line numbers
set number

" Solarized
syntax enable
set background=dark
colorscheme solarized

" Macros
nmap <leader>m :set filetype=markdown<CR>
nmap <leader>w :set nowrap!<CR>
" Open folder of current file
nmap <leader>f :!open .<CR>\|:redraw!<CR>
" Copy contents of whole file
nmap <leader>c :%y+<CR>
" Alternative Solution to increment number while in tmux
nmap <leader>a <C-a>
" Open next URL in file
map <leader>u :.,$w !openurl<CR>    
