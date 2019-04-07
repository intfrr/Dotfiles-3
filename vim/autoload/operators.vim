function! operators#WebSearch(type, ...) abort
  " `@@` is an alias for `@"`, the unnamed register
  let sel_save = &selection
  " From `h :map-operator`: The 'selection' option is temporarily set to
  " "inclusive" to be able to yank exactly the right text by using Visual mode
  " from the '[ to the '] mark.
  let &selection = "inclusive"
  let reg_save = @@

  if a:0 " Invoked from Visual mode, use `gv` command.
    " Visual
    silent exe "normal! gvy"
  elseif a:type == 'line'
    " Line
    silent exe "normal! '[V']y"
  else
    " Character
    silent exe "normal! `[v`]y"
  endif

  let escaped=substitute(@@,'[^A-Za-z0-9_.~-]','\="%".printf("%02X",char2nr(submatch(0)))','g')
  let url="https://duckduckgo.com/?q=".escaped
  silent exec "!open ".shellescape(url, 1)

  let &selection = sel_save
  let @@ = reg_save
endfunction

function! operators#TitleCase(type, ...) abort
  " `@@` is an alias for `@"`, the unnamed register
  let reg_save = @@

  if a:0
    " Visual
    silent exe "normal! gvc\<C-r>=system('~/.bin/title_case',@\")\<CR>\<ESC>"
  elseif a:type == 'line' " Line
    " Line
    silent exe "normal! '[V']c\<C-r>=system('~/.bin/title_case',@\")\<CR>\<ESC>"
  else
    " Character
    silent exe "normal! `[v`]c\<C-r>=system('~/.bin/title_case',@\")\<CR>\<ESC>"
  endif

  let @@ = reg_save
endfunction

function! operators#MarkdownWikiLink(type, ...) abort
  " `@@` is an alias for `@"`, the unnamed register
  let reg_save = @@

  if a:0
    " Visual
    silent exe "normal! gvc\<C-r>=system('~/.bin/markdown_wiki_link '.fnameescape(expand(expand('%:h'))),@@.\"\\n\")\<CR>\<ESC>"
  elseif a:type == 'line' " Line
    " Line
    silent exe "normal! '[V']c\<C-r>=system('~/.bin/markdown_wiki_link '.fnameescape(expand(expand('%:h'))),@@.\"\\n\")\<CR>\<ESC>"
  else
    " Character
    silent exe "normal! `[v`]c\<C-r>=system('~/.bin/markdown_wiki_link '.fnameescape(expand(expand('%:h'))),@@.\"\\n\")\<CR>\<ESC>"
  endif

  let @@ = reg_save
endfunction

function! operators#OpenURLs(type, ...) abort
  " `@@` is an alias for `@"`, the unnamed register
  let sel_save = &selection
  " From `h :map-operator`: The 'selection' option is temporarily set to
  " "inclusive" to be able to yank exactly the right text by using Visual mode
  " from the '[ to the '] mark.
  let &selection = "inclusive"
  let reg_save = @@

  if a:0 " Invoked from Visual mode, use `gv` command.
    " Visual
    silent exe "normal! gvy"
  elseif a:type == 'line'
    " Line
    silent exe "normal! '[V']y"
  else
    " Character
    silent exe "normal! `[v`]y"
  endif

  call system('~/.bin/urls_open', @@)

  let &selection = sel_save
  let @@ = reg_save
endfunction

function! operators#LinkReplace(type, ...) abort
  " `@@` is an alias for `@"`, the unnamed register
  let reg_save = @@

  echom "Replacing phrases with links"

  if a:0 
    " Visual
    silent exe "normal! gvc\<C-r>=system('~/.bin/link_phrase',@\")\<CR>\<ESC>"
  elseif a:type == 'line' " Line
    " Line
    silent exe "normal! '[V']c\<C-r>=system('~/.bin/link_phrase',@\")\<CR>\<ESC>"
  else
    " Character
    silent exe "normal! `[v`]c\<C-r>=system('~/.bin/link_phrase',@\")\<CR>\<ESC>"
  endif

  let @@ = reg_save
endfunction

