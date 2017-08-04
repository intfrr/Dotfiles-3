# grep
# Disable these, there's something very strange about how global aliases call
# interactive commads. Starting `vim` results it in having to start twice,
# which is very slow.
# alias -g G='| grep'
# alias -g C='| column'
# alias -g L='| less'
# alias -g A='| rg'
# alias -g Y='| safecopy'
# alias -g Y1='| safecopy1'
# alias -g V="| $vim-command -"
# alias -g Q='| vim-grep'

# Basic
alias -- -='cd -'
alias ..='cd ..'

if [ ! "$(uname)" = "Darwin" ]; then
  alias ls='ls --color=auto'
else
  alias ls='gls --color=auto'
fi

alias p='safepaste'
alias y='safecopy'
alias safecopy1='tr -d '\''\n'\'' | tee /dev/tty | safecopy'

# Override

# rg
alias rg="rg --smart-case --line-number --colors 'match:fg:black' --colors 'match:bg:cyan' --colors 'path:fg:cyan' --colors 'line:fg:white'"
# mitmproxy
# Supposedly these can be set in a `~/.mitmproxy/config.yaml`, it wasn't
# working with:
# palette_transparent: true
# no_mouse: true
alias mitmproxy='mitmproxy --no-mouse --palette-transparent'
alias atm="tmux-paths -0 | xargs -0 rg --smart-case --line-number"

# vimdiff
alias vimdiff="nvim -d"

# Shortcut

# zsh
alias oi='zsh-edit-config'
alias dh='dirs -v'

# scripts
alias n='terminal-new'
alias o='finder-new'

# tmux
alias tmnd='tmux-name-directory'
alias tma='tmux-attach'
alias tmsr='tmux-session-restore'
alias tmsq='tmux-session-save-quit'
alias tmlp='tmux-paths'
alias tmpr='tmux-paths-run'
alias tmrg='tmux-paths-rg'

# emacs
alias m='magit'
alias e="$EMACS_COMMAND"

# ranger
alias r='ranger-cd'

# vim
alias q='vim-grep'
alias f='fzf-vim-grep'
alias vff='fzf-vim-file'
alias vfg='fzf-vim-grep'
alias vg='vim-grep'
alias vgh='vim-git-hunks'
alias vdg='vim-diff-grep'
alias vgm='vim-git-modified'
alias vgc='vim-git-conflicts'
alias vse='vim-server-edit'
alias vsr='vim-session-restore'
alias vsrd='vim-session-restore-default'
alias vsrl='vim-session-restore-local'
alias vsrs='vim-server-start -c "RestoreSession"'
alias vss='vim-server-start'

# emacs
if [[ "$(uname)" = "Darwin" ]]; then
  alias gemacs="open -a emacs"
fi

# fzf
alias fzp='fzf-file-path'
alias fzs='fzf-snippet-copy'
alias fzb='fzf-bookmark-cd'
alias fzd='fzf-documentation-less'
alias fzrd='fzf-recent-cd'
if [ "$(uname)" = "Darwin" ]; then
  alias ox='fzf-project-xcode'
  alias fzab='fzf-ack-bbedit'
  alias fzam='fzf-ack-mate'
  alias fzo='fzf-file-open'
  alias fzr='fzf-file-reveal'
  alias fzx='fzf-file-xcode'
fi

# doc & snp
alias snp='fzf-snippet-copy'
alias snpe='fzf-snippet-editor'
alias doce='fzf-documentation-editor'
alias docc='fzf-documentation-cat'

# git
alias gstm='tmux-git-status'
alias gyb='git-yank-branch'
alias gyh='git-yank-hash'
alias gyr='git-yank-remote-url'
alias gcd='git-cd-root'
alias dtv='diff-to-grep | vg'
