# grep
# alias -g G='| grep'
# alias -g L='| less'
# alias -g A='| rg'
# alias -g C='| safecopy'
# alias -g V="| $VIM_COMMAND -"

# Basic
alias -- -='cd -'
alias ..='cd ..'

if [ ! "$(uname)" = "Darwin" ]; then
  alias ls='ls --color=auto'
else
  alias ls='gls --color=auto'
fi

alias p='safepaste'
alias c='safecopy'

# Override

# rg
alias rg='rg --smart-case --line-number'
# mitmproxy
# Supposedly these can be set in a `~/.mitmproxy/config.yaml`, it wasn't
# working with:
# palette_transparent: true
# no_mouse: true
alias mitmproxy='mitmproxy --no-mouse --palette-transparent'

# vimdiff
alias vimdiff="nvim -d"

# Shortcut

# zsh
alias ei='zsh-edit-config'

# scripts
alias n='new-terminal-here'
alias o='new-finder-window-here'

# tmux
alias tnd='tmux-name-directory'
alias ta='tmux-attach'

# emacs
alias m='magit'

# ranger
alias r='ranger-cd'

# vim
alias vrs='vim-restore-session'
alias vsr='vim-server-start -c "RestoreSession"'
alias vss='vim-server-start'
alias vse='vim-server-edit'
alias av='ack-vim'
alias af='fzf-ack-vim'

# emacs
if [[ "$(uname)" = "Darwin" ]]; then
  alias gemacs="open -a emacs"
fi

# fzf
alias f='fzf-file-vim'
alias fzp='fzf-file-path'
alias fzs='fzf-snippet-copy'
alias fzse='fzf-snippet-vim'
alias fzb='fzf-bookmark-cd'
alias doc='fzf-documentation-less'
alias doce='fzf-documentation-edit'
alias fzd='fzf-documentation-less'
alias fzde='fzf-documentation-vim'
alias fzrd='fzf-recent-cd'
if [ "$(uname)" = "Darwin" ]; then
  alias ox='fzf-project-xcode'
  alias fzab='fzf-ack-bbedit'
  alias fzam='fzf-ack-mate'
  alias fzo='fzf-file-open'
  alias fzr='fzf-file-reveal'
  alias fzx='fzf-file-xcode'
fi

# git
alias gvm='git-vim-modified'
alias gcd='git-cd-root'
