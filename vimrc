" vim:fdm=marker
" Disable Plugins
" let g:pathogen_disabled = ["vim-rsi"]

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Basic
set nocompatible
set directory=/tmp " Temp files
" set clipboard=unnamed " Make the OS X clipboard work
let mapleader = ','

" Normalizing Key Commands
" Kill line
noremap! <C-k> <C-O>d$

" Look & Feel
colorscheme ir_black
" hi Search ctermbg=DarkGray " Search highlight color
set linebreak " Line breaks only happen on words
set number " Show line numbers
set hlsearch " Highlight search results
" set ignorecase " Ignore case in search results
" set smartcase " Override `ignorecase`

" Leader Commands
" Make Markdown Filetype
" nmap <leader>m :set filetype=markdown<CR>
" Toggle No Wrap
" nmap <leader>w :set nowrap!<CR>
" Open folder of current file
nmap <leader>f :!open .<CR>\|:redraw!<CR>
" Copy contents of whole file
nmap <leader>c :%y+<CR>
" Alternative Solution to increment number while in tmux
" nmap <leader>a <C-a>
" Open next URL in file
" map <leader>u :.,$w !openurl<CR>    
" Detect File type
" map <leader>d :filetype detect<CR>
