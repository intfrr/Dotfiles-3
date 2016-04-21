" Temporary Directories {{{1

" Fix arrow keys
if &term =~ '^screen'
  " tmux will send xterm-style keys when xterm-keys is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" Swap File directory
" Double-slash prevents name collusions
let s:temporary_directory = "/tmp/vim.robenkleene/"
let s:swap_file_directory = s:temporary_directory . "swap"
let s:viewdir_directory = s:temporary_directory . "view"
if !isdirectory(s:swap_file_directory)
  call mkdir(s:swap_file_directory, 'p')
endif
if !isdirectory(s:viewdir_directory)
  call mkdir(s:viewdir_directory, 'p')
endif
let &directory=s:swap_file_directory . "//"
let &viewdir=s:viewdir_directory


" Basic {{{1

" Path
" Setting path this way doesn't appear to do anything
" let $PATH='~/.nvm/versions/node/v0.12.2/bin:~/.rbenv/shims:~/.rbenv/bin:/usr/local/bin:~/Development/Scripts/bin:' . $PATH

" Syntax highlighting
syntax on

" Use system clipboard by default
set clipboard=unnamed 

" Treat `_` and `-` as a word boundary
set iskeyword-=_

" Leader
let mapleader = "\<space>"
let maplocalleader = "\\"

" Allow hidden buffers
set hidden

" Text
set nowrap

" Automatically change the working directory
" This interferes with `ag`
" set autochdir
" Just autoset the directory for netrw
" let g:netrw_keepdir = 0

" Show commands as they're typed
set showcmd


" Line breaks only happen on words
set linebreak 

" Default Fold Method
set foldmethod=syntax

" Don't Start Folded
set nofoldenable

" Ignore case in search results
set ignorecase

" Override `ignorecase`
set smartcase

" Don't let smartase affect autocomplete
set infercase

" open previews vertically
" let g:netrw_preview = 1

" Open splits in bottom right
set splitbelow
set splitright

" Autocmd {{{1

" Make Shebang Files Executable
function! s:MakeShebangFilesExecutable()
  if match(getline(1), '^\#!') == 0
    if match(getfperm(expand('%:p')), 'x') == -1
      !chmod +x %
    endif
  endif
endfunction
augroup executable_files
  autocmd!
  autocmd BufWritePost *.sh,*.rb :call <SID>MakeShebangFilesExecutable()
augroup END

" Languages {{{1

" Doesn't work in ftplugin
let g:xml_syntax_folding=1
