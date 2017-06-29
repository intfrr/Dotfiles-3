nnoremap <leader>gd :Git d<CR>
nnoremap <leader>gaa :Git aa<CR>
nnoremap <leader>gp :Git p<CR>
nnoremap <leader>gc :Gco<CR>
nnoremap <leader>gs :Gstatus<CR>

" cnoreabbrev Gs Gstatus

" augroup git_commands
"   autocmd!
"   autocmd FileType * nnoremap <buffer> <localleader>gd :Git diff "%"<CR>
"   autocmd FileType gitcommit nnoremap <buffer> <localleader>gd :Git diff<CR>
" augroup END
