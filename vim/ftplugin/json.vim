command! Beautify :%!python -m json.tool
nnoremap <localleader>b :Beautify<CR>

" Disable Conceal
" let g:vim_json_syntax_conceal = 0
