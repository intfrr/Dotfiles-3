# Override

# ag
alias ag 'ag --path-to-ignore ~/.ignore'
# rg
alias rg 'rg --smart-case --line-number'
# mitmproxy
# Supposedly these can be set in a `~/.mitmproxy/config.yaml`, it wasn't
# working with:
# palette_transparent: true
# no_mouse: true
alias mitmproxy 'mitmproxy --no-mouse --palette-transparent'

if test (uname) = Darwin
  alias ls 'gls --color=auto'
else
  alias ls 'ls --color=auto'
end

# Shortcut

# scripts
alias n 'new-terminal-here'
alias o 'new-finder-window-here'

# fish
alias ei 'fish-edit-config'
alias fea 'fish-edit-abbreviations'
alias fsa 'fish-sync-abbreviations'
alias fsh 'fish-sync-history'

# Cut & Paste
alias p 'safepaste'
alias c 'safecopy'

# ack
# alias a 'ag'
alias a 'rg'

# z
alias zv 'fasd -f -e vim'

# tig
alias ts 'tig status +3'

# tmux
alias tmls 'tmux ls'
alias tnd 'tmux-name-directory'

# emacs
alias ec 'emacsclient -t'
alias e 'emacs-edit'
alias m 'magit'

# ranger
alias r 'ranger-cd'

# vim
alias v 'vim-edit' 
alias va 'vim-pipe-grep' 
alias vrs 'vim-restore-session'
alias vsr 'vim-server-start -c "RestoreSession"'

# fzf
alias f 'fzf-file-vim'
alias s 'fzf-tmux-window'
alias fa 'fzf-ack-vim' 
alias fzp 'fzf-file-path'
alias fzs 'fzf-snippet-copy'
alias fzse 'fzf-snippet-vim'
alias fzb 'fzf-bookmark-cd'
alias fzd 'fzf-documentation-vim'
alias fzrd 'fzf-recent-cd'
alias fzw 'fzf-tmux-window'
if test (uname) = Darwin
  alias ox 'fzf-project-xcode'
  alias fzab 'fzf-ack-bbedit'
  alias fzam 'fzf-ack-mate'
  alias fzo 'fzf-file-open'
  alias fzr 'fzf-file-reveal'
  alias fzx 'fzf-file-xcode'
end

# ssh
if not test (uname) = Darwin
  alias shs 'ssh-start'
end

# BBEdit
if test (uname) = Darwin
  alias bbr 'bbedit-pipe-grep'
end

# git
alias gvm 'git-vim-modified'
alias gur 'git pull --rebase'
alias gu 'git pull'
alias gsmi 'git submodule init'
alias gsmu 'git submodule update'
alias gs 'git status'
alias grc 'git rebase --continue'
alias gpt 'git push --tags'
alias gp 'git push'
alias gf 'git fetch'
alias gcd 'git-cd-root'
alias gca 'git commit --amend'
alias gbr 'git branch --remotes'
alias gbpr 'git-prune-remote-origin'
alias gprb 'git-prune-remote-origin'
alias gaa 'git add --all :/'

# hub
if test (uname) = Darwin
  alias hb 'hub browse'
  alias hbc 'hub browse -- commits'
end
