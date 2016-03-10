" Startup {{{1

if &shell =~# 'fish$'
  set shell=bash
endif

" Plugins {{{1

" Install Vim-Plug if it is missing
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
" Tim Pope {{{2
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
" Colors {{{2
Plug 'guns/xterm-color-table.vim'
Plug 'ap/vim-css-color'
" Editing {{{2
Plug 'justinmk/vim-sneak'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
if has('lua')
  Plug 'Shougo/neocomplete.vim'
end
" Git {{{2
Plug 'airblade/vim-gitgutter'
" Search {{{2
if !has('gui_running')
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
end
Plug 'rking/ag.vim'
" Languages {{{2
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
call plug#end()

" Source {{{1
source ~/.vim/robenkleene/settings.vim
source ~/.vim/robenkleene/ui.vim
if !has('gui_running')
  source ~/.vim/robenkleene/colors.vim
endif
source ~/.vim/robenkleene/movement.vim
source ~/.vim/robenkleene/commands.vim
source ~/.vim/robenkleene/bindings.vim

" Source Plugins {{{1
source ~/.vim/robenkleene/plugins/sneak.vim
source ~/.vim/robenkleene/plugins/surround.vim
if !has('gui_running')
  source ~/.vim/robenkleene/plugins/fzf.vim
end
if has('lua')
  source ~/.vim/robenkleene/plugins/neocomplete.vim
end
source ~/.vim/robenkleene/plugins/fugitive.vim
