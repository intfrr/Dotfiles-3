augroup dirvish_config
  autocmd!
  autocmd FileType dirvish nnoremap <silent><buffer>gh :<C-u>DirvishToggleHidden<CR>:Dirvish %<CR>
  autocmd FileType dirvish nnoremap <buffer><silent> <C-L> :Dirvish %<CR>
  autocmd FileType dirvish nnoremap <localleader>m :call <SID>SetupCommandOnFile("mv")<CR>
  " Dirvish maps these for the following reason, probably a mistake to unmap
  " but I find them ugly
  " "Buffer-local / and ? mappings to skip the concealed path fragment."
  autocmd FileType dirvish if !empty(maparg('/', 'n')) | nunmap <buffer> /| endif
  autocmd FileType dirvish if !empty(maparg('?', 'n')) | nunmap <buffer> ?| endif
  " Autochange the directory
  " autocmd FileType dirvish silent! lcd %:p:h
augroup END

command! DirvishToggleHidden call <SID>ToggleHidden()
command! SetupCommandOnFile call <SID>SetupCommandOnFile()

function! s:ToggleHidden() abort
  if exists("g:dirvish_mode")
    unlet g:dirvish_mode
  else
    " This is the official way, but this doesn't work with
    " `g:dirvish_relative_paths`
    " let g:dirvish_mode = ':silent keeppatterns g@\v/\.[^\/]+/?$@d _'
    " This simpler pattern works with `g:dirvish_relative_paths`
    " let g:dirvish_mode = ':silent keeppatterns g/^\..\+/d'
    " `@` is alternative regex syntax
    " `d` is for delete
    let g:dirvish_mode = ':silent keeppatterns g@\v(/|^)\.[^\/]+@d _'
  endif
endfunction

function! s:SetupCommandOnFile(cmd) abort
  let reg_save = @@
  let reg_save_a = @a
  silent exe "normal! ^yg_"
  let filename_string = @@
  let filename = fnameescape(expand(filename_string))
  let @@ = a:cmd
  call feedkeys(':!' . a:cmd . " " . filename . " ")
  let @@ = reg_save
endfunction

" Default to hidden
call <SID>ToggleHidden()

" This makes it easier to yank what is expected
let g:dirvish_relative_paths = 1
