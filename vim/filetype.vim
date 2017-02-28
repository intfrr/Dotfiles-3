if exists("did_load_filetypes")
  finish
endif

augroup setup_filetype
  autocmd!
  au! BufRead,BufNewFile *.conf setfiletype conf
  au! BufRead,BufNewFile *.m,*.h setfiletype objc
  au! BufRead,BufNewFile Fastfile setfiletype ruby
augroup END
