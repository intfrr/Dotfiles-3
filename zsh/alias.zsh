# grep
alias -g G='| grep'
alias -g L='| less'

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

# Shortcut

# Parameters
alias va='vim-pipe-grep' 
alias fa='fzf-ack-vim' 

# zsh
alias ei='zsh-edit-config'

# scripts
alias n='new-terminal-here'
alias o='new-finder-window-here'

# tig
alias ts='tig status +3'

# tmux
alias tmls='tmux ls'
alias tnd='tmux-name-directory'

# emacs
alias ec='emacsclient -t'
alias e='emacs-edit'
alias m='magit'

# ranger
alias r='ranger-cd'

# vim
alias vrs='vim-restore-session'
alias vsr='vim-server-start -c "RestoreSession"'

# fzf
alias f='fzf-file-vim'
alias fzp='fzf-file-path'
alias fzs='fzf-snippet-copy'
alias fzse='fzf-snippet-vim'
alias fzb='fzf-bookmark-cd'
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
alias gur='git pull --rebase'
alias gu='git pull'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gs='git status'
alias grc='git rebase --continue'
alias gpt='git push --tags'
alias gp='git push'
alias gf='git fetch'
alias gcom='git checkout -- .'
alias gcd='git-cd-root'
alias gca='git commit --amend'
alias gbr='git branch --remotes'
alias gbpr='git-prune-remote-origin'
alias gprb='git-prune-remote-origin'
alias gaa='git add --all :/'

# hub
if [ "$(uname)" = "Darwin" ]; then
  alias hb='hub browse'
  alias hbc='hub browse -- commits'
fi
