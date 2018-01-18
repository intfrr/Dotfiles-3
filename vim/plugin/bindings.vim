" Key Commands {{{1

" `C-G` to `<Esc>` like Emacs
" rsi plugin implementation
" cmap <script> <C-G> <C-C>
" vnoremap <C-g> <Esc>:f<CR>

" Backwards delete word
" noremap! <M-BS> <C-W>
" if !has("gui_running") && !has('nvim')
"   silent! exe "set <F34>=\<Esc>\<C-?>"
"   silent! exe "set <F35>=\<Esc>\<C-H>"
"   map! <F34> <M-BS>
"   map! <F35> <M-BS>
"   map <F34> <M-BS>
"   map <F35> <M-BS>
" endif

" Fix Y
nnoremap Y y$

" Alternative exit insert mode
" inoremap jk <esc>

" `C-y` paste like in Emacs
" cnoremap <C-y> <C-r>*
" inoremap <C-y> <C-r>*

" `C-w` insert word at point like Emacs
" cnoremap <C-w> <C-R><C-W>

" Leader
" Leader seems to nned to be set before leader mappings?
let mapleader = "\<space>"
let maplocalleader = "\\"

" vimrc
nnoremap <leader>oi :cd ~/Development/Dotfiles/vim/<CR>:edit init.vim<CR>:echo ""<CR>
nnoremap <leader>si :source $MYVIMRC<CR>:echo "Sourced"<CR>
" Macros
nnoremap <leader>om :new<CR>:set buftype=nofile<CR>V"wp
nnoremap <leader>sm V"wd:bd<CR>
" Local Settings
" Can't use `s` because it conflicts with "s" for snippets
" `l` is for "local"
nnoremap <leader>sl :source vim_settings<CR>
nnoremap <leader>ol :edit vim_settings<CR>
" Build Log
nnoremap <leader>ob :edit build.log<CR>
nnoremap <leader>ot :edit test.log<CR>

" Documentation
" nnoremap <leader>d :split ~/Documentation/development-references/Vim/<CR>:cd %<CR>:echo ""<CR>

" Toggle No Wrap
" Local to window
nnoremap <localleader>w :set wrap!<CR>
nnoremap <leader>w :set wrap!<CR>

" Toggle Seplling
" Local to window
nnoremap <localleader>s :set spell!<CR>

" Open Working Directory in Terminal
nnoremap <leader>T :silent !open -a Terminal "%:p:h"<CR>\|:redraw!<CR>

" Reveal Current File
nnoremap <leader>R :silent !open -R "%:p"<CR>\|:redraw!<CR>

" TextMate
nnoremap <leader>E :silent !mate --async "%:p"<CR>\|:redraw!<CR>

" Xcode
nnoremap <leader>X :silent !open -a Xcode "%:p"<CR>\|:redraw!<CR>

" `make`
nnoremap <leader>m :make<CR>

" Rg
nnoremap <leader>a :Rg 

" Quit & Save Session
nnoremap <A-s> :QuitSaveSession<CR> 
" Don't use this `ZZ` only quits the current buffer, which is useless for
" preserving state
" nnoremap <silent> ZZ :SessionSave<CR>ZZ

" Make split resizing five lines instead of one
nnoremap <C-w>+ 5<C-w>+
nnoremap <C-w>- 5<C-w>-
nnoremap <C-w>< 5<C-w><
nnoremap <C-w>> 5<C-w>>

" Copy Current line to clipboard cleaned for shell pasting
" I.e., this removes any whitespace form the beginning and end of the line
" and removes the last new line
" nnoremap <silent> <leader>yy :silent .w !sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' 
"             \ <BAR> tr -d "\n" <BAR> pbcopy<CR>

" Move frames
" Handled by `vim-tmux-navigator`
" nnoremap <S-Down> <C-w><C-j>
" nnoremap <S-Up> <C-w><C-k>
" nnoremap <S-Right> <C-w><C-l>
" nnoremap <S-Left> <C-w><C-h>

" Yank GitHub Links
nnoremap <localleader>l :call bindings#LinkGitHubYank()<CR>
vnoremap <localleader>l :'<,'>call bindings#LinkGitHubYankLines()<CR>
" Yank GitHub Markdown Links
nnoremap <localleader>m :call bindings#LinkGitHubMarkdownYank()<CR>
vnoremap <localleader>m :'<,'>call bindings#LinkGitHubMarkdownYankLines()<CR>
" Open GitHub Links
nnoremap <localleader>L :call bindings#LinkGithubOpen()<CR>
vnoremap <localleader>L :'<,'>call bindings#LinkGithubOpenLines()<CR>

" Copy Path
nnoremap <leader>yp :let @*=expand("%:p")<CR>
nnoremap <leader>yf :let @*=expand("%:t")<CR>
nnoremap <leader>yd :let @*=expand('%:p:h:t')<CR>

" Backup Text
command! -bang -range BackupText <line1>,<line2>call bindings#ArchiveLines(<bang>0)
vnoremap <localleader>a :'<,'>BackupText<CR>
vnoremap <localleader>d :'<,'>BackupText!<CR>

" `grep` Visual Star
" makes * and # work on visual mode too.
xnoremap * :<C-u>call bindings#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call bindings#VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" `rg` Visual Star
" With a visual selection, an exact term is searched for
" With no visual selection, the current word is searched for
" (The `\\|` is not intuitive, this is because `|` separates commands in
" Vimscript)
nnoremap <leader>* :Rg '(^\\|\W)<C-r><C-w>($\\|\W)'<CR>
vnoremap <leader>* :<C-u>call bindings#GrepVisual()<CR>

" Panes
" The problem with `tmux` Vim navigator is that if Vim is opened form a
" subprocess in a `tmux` pane (e.g., `tig -> Vim`), then moving between Vim
" panes will break, because `tmux` won't be able to detect that Vim is
" actually running as a child of `tig`.

noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l

noremap <S-Left> <C-w>h
noremap <S-Down> <C-w>j
noremap <S-Up> <C-w>k
noremap <S-Right> <C-w>l

" Open and Close Tab
nnoremap <C-w>t :tabnew<CR>
vnoremap <C-w>t :<C-u>tabnew<CR>
nnoremap <C-w>q :tabclose<CR>
vnoremap <C-w>q :<C-u>tabclose<CR>
" Switching Tabs
nnoremap <A-n> gt
nnoremap <A-p> gT
vnoremap <A-n> gt
vnoremap <A-p> gT
nnoremap <C-w>n gt
nnoremap <C-w>p gT
vnoremap <C-w>n gt
vnoremap <C-w>p gT

" Disable these use the above ones, these are too easy to accidently open new
" splits with `<C-w><C-n>`, also `<C-w>n` is a default new split binding.
" nnoremap <C-w>n gt
" nnoremap <C-w>p gT

" Quickfix
nnoremap <script> <silent> <leader>q :call bindings#ToggleQuickfixList()<CR>

" Todo
nnoremap <leader>d :call bindings#OpenTodo()<CR>
