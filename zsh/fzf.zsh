export FZF_DEFAULT_COMMAND='rg --files -g ""'

# fzf
# Make `fzf` bindings available, since this is being manually imported here
# `fzf` should be installed at `~/.fzf/`, using the command 
# `~/.fzf/install --bin`, which avoids installing the completions automatically
FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh
# Put back default history search
bindkey '^R' history-incremental-search-backward
bindkey '^[r' fzf-history-widget

# Private

function _robenkleene_fzf_inline() {
  local result_cmd=$1
  local list_cmd=${2-$FZF_DEFAULT_COMMAND} 
  setopt localoptions pipefail 2> /dev/null
  local result="$(eval "$list_cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$result" ]]; then
    return 0
  fi
  local parameter=$(printf '%q' "$result")
  local final_cmd="$result_cmd $parameter"
  eval $final_cmd
  local ret=$?
  if [ $? -eq 0 ]; then
    # Add to history
    print -sr $final_cmd
  fi
  return $ret
}

function _robenkleene_fzf_inline_result() {
  local list_cmd=${1-$FZF_DEFAULT_COMMAND} 
  setopt localoptions pipefail 2> /dev/null
  local result="$(eval "$list_cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS" $(__fzfcmd) +m)"
  local ret=$?
  echo $result
  return $ret
}

# Directories

# History
function fzf-recent-cd() {
  _robenkleene_fzf_inline cd "fasd -ld"
}

function fzf-bookmark-cd() {
  # Bookmarks
  local bookmarks=(~/Development/Dotfiles/)
  # Documentation
  bookmarks+=(~/Documentation/ ~/Documentation/development-references/)
  # Development
  bookmarks+=(~/Development/ ~/Development/Scratch/ ~/Development/Projects/ ~/Development/Scripts/ ~/Development/Snippets/)
  _robenkleene_fzf_inline cd "printf '%s\n' $bookmarks"
}

# Files

# Vim
function fzf-file-vim() {
  _robenkleene_fzf_inline $VIM_COMMAND
}

# Reveal
if [ "$(uname)" = "Darwin" ]; then
  function fzf-file-reveal() {
    _robenkleene_fzf_inline "open -R"
  }
fi

# Open
if [ "$(uname)" = "Darwin" ]; then
  function fzf-file-open() {
    _robenkleene_fzf_inline open
  }
fi

# Path
function fzf-file-cd() {
  local result=$(_robenkleene_fzf_inline_result)
  if [[ -n $result ]]; then
    cd $(dirname $result)
  fi
}
function fzf-file-path() {
  local result=$(_robenkleene_fzf_inline_result)
  if [[ -n $result ]]; then
    echo $result | tr -d '\n' | tee /dev/tty | safecopy
  fi
}

# Lines
function fzf-line-vim() {
  local result=$(_robenkleene_ack_lines_color "[a-zA-Z0-9]+" . | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --ansi $FZF_DEFAULT_OPTS" $(__fzfcmd) +m )
  if [[ -n $result ]]; then
    echo $result | $VIM_COMMAND -c "GrepBuffer" -
  fi
}

# Documentation
function fzf-documentation-less() {
  cd ~/Documentation/
  local result=$(_robenkleene_fzf_inline_result)
  if [[ -n $result ]]; then
    local parameter=$(printf '%q' "$PWD/$result")
    local final_cmd="cat $parameter | less"
    eval $final_cmd
    if [ $? -eq 0 ]; then
      # Add to history
      print -sr $final_cmd
    fi
  fi
  cd -
}
function fzf-documentation-vim() {
  cd ~/Documentation/
  local result=$(_robenkleene_fzf_inline_result)
  if [[ -n $result ]]; then
    local parameter=$(printf '%q' "$PWD/$result")
    local final_cmd="$VIM_COMMAND $parameter"
    eval $final_cmd
    if [ $? -eq 0 ]; then
      # Add to history
      print -sr $final_cmd
    fi
  else
    cd -
  fi
}

# Snippets
function fzf-snippet-copy() {
  cd ~/Development/Snippets/
  local result=$(_robenkleene_fzf_inline_result)
  if [[ -n $result ]]; then
    echo $result | tr '\n' '\0' | xargs -0 cat | tee /dev/tty | safecopy
  fi
  cd -
}
function fzf-snippet-vim() {
  cd ~/Development/Snippets/
  local result=$(_robenkleene_fzf_inline_result)
  if [[ -n $result ]]; then
    local parameter=$(printf '%q' "$PWD/$result")
    local final_cmd="$VIM_COMMAND $parameter"
    eval $final_cmd
    if [ $? -eq 0 ]; then
      # Add to history
      print -sr $final_cmd
    fi
  else
    cd -
  fi
}

# Xcode
if [ "$(uname)" = "Darwin" ]; then
  function fzf-project-xcode() {
    setopt localoptions pipefail 2> /dev/null
    find . -path '*.xcodeproj' -prune -o -name '*.xcworkspace' -o -name '*.xcodeproj' \
      | grep -vE "\/Carthage\/" \
      | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --select-1 $FZF_DEFAULT_OPTS" $(__fzfcmd) +m \
      | tr '\n' '\0' \
      | xargs -0 open
  }
fi
if [ "$(uname)" = "Darwin" ]; then
  function fzf-file-xcode() {
    local ack_search_xcode="$FZF_DEFAULT_COMMAND --glob \"*.swift\" --glob \"*.h\" --glob \"*.m\""
    eval $ack_search_xcode \
      | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS" $(__fzfcmd) +m \
      | tr '\n' '\0' \
      | xargs -0 open -a "Xcode"
  }
fi

# ack
function fzf-vim-grep() {
  FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --ansi $FZF_DEFAULT_OPTS" $(__fzfcmd) +m | local result=`cat`
  echo $result | $VIM_COMMAND -c "GrepBuffer" -
}
