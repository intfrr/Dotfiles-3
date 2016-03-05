" Color Scheme
colorscheme ir_black
set background=dark
" Background
let s:bgcolor = 'gray12'
let s:backgroundgroups = ['CursorColumn', 
            \ 'NonText', 'SpecialKey', 'VertSplit',
            \ 'Normal', 'FoldColumn', 'SignColumn'] 
for group in s:backgroundgroups
    exe 'highlight ' . group . ' guibg=' . s:bgcolor
endfor
highlight CursorLine guibg=NONE
" Line Numbers
let s:gutterbgcolor = 'gray20'
let s:gutterfgcolor = 'DarkGray'
let s:gutterfgbggroups = ['LineNr', 'StatusLineNC']
let s:gutterbggroups = ['CursorLineNr', 'ColorColumn', 'Cursorline']
for group in s:gutterfgbggroups
    exe 'highlight ' . group . ' guibg=' . s:gutterbgcolor . ' guifg=' .  
                \ s:gutterfgcolor
endfor
for group in s:gutterbggroups
    exe 'highlight ' . group . ' guibg=' . s:gutterbgcolor
endfor
" Selection
let s:selectionbgcolor = 'lightblue'
let s:selectionfgcolor = 'black'
let s:selectiongroups = ['Search', 'Wildmenu']
for group in s:selectiongroups
    exe 'highlight ' . group . ' guibg=' . s:selectionbgcolor  . ' guifg=' .  
                \ s:selectionfgcolor
endfor
highlight Visual guifg=white guibg=darkcyan
highlight IncSearch guifg=darkcyan guibg=white
highlight Search gui=NONE
" StatusLine
highlight StatusLine guibg=Gray guifg=black gui=NONE
" NC StatusLine bg is gutter color
highlight StatusLineNC guifg=DarkGray
" Tildes
highlight NonText guifg=DarkGray
" Diff 
highlight DiffAdd gui=NONE guifg=green guibg=darkgreen
highlight DiffDelete gui=NONE guifg=red guibg=darkred
highlight DiffChange gui=NONE guifg=NONE guibg=NONE
highlight DiffText gui=NONE guifg=lightblue guibg=darkblue
" highlight DiffChange gui=NONE guifg=brown guibg=yellow
" highlight DiffText gui=NONE guifg=lightblue guibg=darkblue
" Git Gutter Colors
highlight GitGutterAdd guifg=green
highlight GitGutterChange guifg=lightblue
highlight GitGutterDelete guifg=red
highlight GitGutterAddDefault guibg=NONE guifg=green
highlight GitGutterChangeDefault guibg=NONE guifg=lightblue
highlight GitGutterDeleteDefault guibg=NONE guifg=red
highlight GitGutterAddInvisible guibg=NONE guifg=green
highlight GitGutterChangeInvisible guibg=NONE guifg=lightblue
highlight GitGutterDeleteInvisible guibg=NONE guifg=red
" Syntastic Colors
highlight SyntasticErrorSign guifg=red
highlight SyntasticWarningSign guifg=yellow
highlight SyntasticStyleWarningSign guifg=yellow
" highlight SyntasticErrorLine guibg=red
" Warning Message
highlight WarningMsg guifg=white guibg=red gui=bold
