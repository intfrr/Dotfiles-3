setlocal equalprg=rubocop\ --auto-correct\ --stdin\ -\ 2>/dev/null\ \|\ sed\ '1,/^====================$/d'
let b:FormatPrg = "rubocop --auto-correct --stdin - 2>/dev/null | sed '1,/^====================$/d'"
