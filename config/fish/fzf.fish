# `resolvedir` is an array whose first item is either `$TMPDIR` or `/tmp` if
# that's nil
set resolvedir $TMPDIR /tmp
set tmpdir $resolvedir[1]

function _robenkleene_ack_lines
  # ag
  # ag --nobreak --noheading $argv
  # rg
  rg --no-heading $argv
end
function _robenkleene_ack_lines_color
  # ag
  # _robenkleene_ack_lines --color $argv
  # rg
  _robenkleene_ack_lines --color=always $argv
end
function _robenkleene_ack_lines_no_color
  # ag
  # _robenkleene_ack_lines --nocolor $argv
  # rg
  _robenkleene_ack_lines --color=never $argv
end

# ag
# set -x FZF_DEFAULT_COMMAND 'ag --hidden --ignore ".git" -g ""'
# rg
set -x FZF_DEFAULT_COMMAND 'rg --files -g ""'

# Helper
function fzf-process-result
  if [ (cat $tmpdir/fzf.result | wc -l) -gt 0 ]
    set -g FZFRESULT (cat $tmpdir/fzf.result)
    and echo $FZFRESULT
    rm -f $tmpdir/fzf.result
    return 0
  else
    set -e FZFRESULT
    rm -f $tmpdir/fzf.result
    return 1
  end
end

# Directories

# history
function fzf-recent-cd
  fasd -l | fzf  > $tmpdir/fzf.result
  set result (fzf-process-result)
  and cd "$result"
end

function fzf-bookmark-cd
  # Bookmarks
  set -l bookmarks ~/Development/Dotfiles/ 
  # Documentation
  set bookmarks $bookmarks ~/Documentation/ ~/Documentation/development-references/
  # Development
  set bookmarks $bookmarks ~/Development/ ~/Development/Scratch/ ~/Development/Projects/ ~/Development/Scripts/ ~/Development/Snippets/

  printf '%s\n' $bookmarks | fzf > $tmpdir/fzf.result
  set result (fzf-process-result)
  and cd "$result"
end

# Files


# vim
function fzf-file-vim
  # Using `xargs` causes tmux `pane_current_path` to fail
  # fzf | tr '\n' '\0' | xargs -0 -o vim
  fzf > $tmpdir/fzf.result
  set result (fzf-process-result)
  and vim-edit "$result"
end


# reveal
if test (uname) = Darwin
  function fzf-file-reveal
    fzf | tr '\n' '\0' | xargs -0 open -R
  end
end

# open
if test (uname) = Darwin
  function fzf-file-open
    fzf | tr '\n' '\0' | xargs -0 open
  end
end

# cd
function fzf-file-cd
  fzf > $tmpdir/fzf.result
  set result (dirname (fzf-process-result))
  and cd "$result"
end

# path
function fzf-file-path
  fzf | tr -d '\n' | tee /dev/tty | safecopy
end

# Documentation
function fzf-documentation-vim
  cd ~/Documentation/
  # Using `xargs` causes tmux `pane_current_path` to fail
  # find * -type f | fzf | tr '\n' '\0' | xargs -0 -o vim
  find * -type f -not -path '*/\.*' | fzf > $tmpdir/fzf.result
  cd -
  set result (fzf-process-result)
  and vim-edit "$HOME/Documentation/$result"
end

# Lines

# vim
function fzf-line-vim
  _robenkleene_ack_lines_no_color "[a-zA-Z0-9]+" . | fzf --ansi > $tmpdir/fzf.result
  set result (fzf-process-result)
  and echo $result | vim -c "GrepBuffer" - 
end

# Snippets

# Copy
function fzf-snippet-copy
  cd ~/Development/Snippets/
  find * -type f | fzf | tr '\n' '\0' | xargs -0 cat | tee /dev/tty | safecopy
  cd -
end

# vim
function fzf-snippet-vim
  cd ~/Development/Snippets/
  # Using `xargs` causes tmux `pane_current_path` to fail
  # find * -type f | fzf | tr '\n' '\0' | xargs -0 -o vim
  find * -type f | fzf > $tmpdir/fzf.result
  cd -

  set result (fzf-process-result)
  and vim-edit "$HOME/Development/Snippets/$result"
end

# Project

# Xcode
if test (uname) = Darwin
  function fzf-project-xcode
    find . -path '*.xcodeproj' -prune -o -name '*.xcworkspace' -o -name '*.xcodeproj' | grep -vE "\/Carthage\/" | fzf  --select-1 | tr '\n' '\0' | xargs -0 open
  end
end

if test (uname) = Darwin
  function fzf-file-xcode
    # rg
    # `ag` version isn't written yet
    set ack_search_xcode $FZF_DEFAULT_COMMAND --glob \"*.swift\" --glob \"*.h\" --glob \"*.m\"
    eval $ack_search_xcode | fzf  --select-1 | tr '\n' '\0' | xargs -0 open -a "Xcode"
  end
end

# ack

function fzf-ack-vim
  echo $argv | tr -d '\n' | safecopy -pboard find
  _robenkleene_ack_lines_color $argv . | fzf --ansi > $tmpdir/fzf.result
  set result (fzf-process-result)
  if test (uname) = Darwin
    set setup_system_clipboard "| let @0=@*"
  end
  and echo $result | vim-edit -c "GrepBuffer" -c "let @/='$argv[-1]' $setup_system_clipboard | set hlsearch" -
end


if test (uname) = Darwin
  function fzf-ack-bbedit
    echo $argv | tr -d '\n' | safecopy -pboard find
    _robenkleene_ack_lines_color $argv . | fzf --ansi > $tmpdir/fzf.result
    set result (fzf-process-result)
    and echo $result | awk -F  ":" '{ print "+"$2 " " $1 }' | tr '\n' '\0' | xargs -0 -I '{}' sh -c "bbedit {}"
  end
end

if test (uname) = Darwin
  function fzf-ack-mate
    echo $argv | tr -d '\n' | safecopy -pboard find
    _robenkleene_ack_lines_color $argv . | fzf --ansi > $tmpdir/fzf.result
    set result (fzf-process-result)
    and echo $result | awk -F  ":" '{ print "--line="$2 " " $1 }' | tr '\n' '\0' | xargs -0 -I '{}' sh -c "mate {}"
  end
end
