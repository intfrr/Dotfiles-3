" vim:fdm=marker
" General {{{1
let g:markdown_folding = 1
set foldlevel=1

" Commands {{{1

" Markdown Preview
" command! MarkdownPreview :execute '!mdprev '.shellescape(expand('%:p'), 1)
" nmap <silent> <leader>p :MarkdownPreview<CR>\|:redraw!<CR>

" OS X Shortcut Special Characters
" command! InsertShortcutSymbols :normal i⇧⌃⌥⌘<ESC>
" nmap <leader>s :InsertShortcutSymbols<CR>

" Quoting Lines
" :command! LineToQuote :normal I> <ESC>
" nmap <leader>q :LineToQuote<CR>

" Creating List Items {{{2
" Create list item from clipboard
" :command! ListItemFromClipboard :normal o<esc>pI- <ESC>
" nmap <leader>v :ListItemFromClipboard<CR>
" Line to list item
" :command! LineToListItem :normal I- <ESC>
" nmap <leader>l :LineToListItem<CR>

" Creating Headers {{{2
" :command! Header1 :normal O<esc>O# <esc>
" nmap <leader>1 :Header1<CR>:startinsert!<CR>
" :command! Header2 :normal O<esc>O## <esc>
" nmap <leader>2 :Header2<CR>:startinsert!<CR>
" :command! Header3 :normal O<esc>O### <esc>
" nmap <leader>3 :Header3<CR>:startinsert!<CR>
