# ranger
function ranger-cd() {
  local tempfile='/tmp/chosendir'
  ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# egitn
function egitn() {
  local egitnext=$(egit -n)
  if [ -n "$egitnext" ]; then
    cd "$egitnext"
    git status
  fi
}

# vim
function vim-edit() {
  if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    nvimedit $@
  else
    nvim $@
  fi
}

# ssh
function ssh-start() {
  eval `ssh-agent -c`
  ssh-add
}

# zsh
function zsh-edit-config() {
  cd ~/Development/Dotfiles/
  vim-edit zshrc
}


# neovim
function vim-server-start() {
  if [ -z "$TMUX" ]; then
    NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim $@
  else
    nvim_session_id=$(tmux display-message -p '#{session_id}')
    NVIM_LISTEN_ADDRESS=/tmp/nvimsocket$nvim_session_id nvim $@
  fi
}
function vim-server-edit() {
  if [ -z "$TMUX" ]; then
    nvr $@
  else
    nvim_session_id=$(tmux display-message -p '#{session_id}')
    nvr --servername /tmp/nvimsocket$nvim_session_id $argv
  fi
}

