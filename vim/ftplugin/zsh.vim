setlocal foldmethod=indent

" setlocal equalprg=shfmt\ -i\ 2\ -ci
let b:FormatPrg = "shfmt -i 2 -ci"

let b:RunMakePrg = "zsh ".fnameescape(expand('%:p'))

let b:ExecutePrg = "zsh"
