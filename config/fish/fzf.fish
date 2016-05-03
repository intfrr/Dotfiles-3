# fzf
set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# Helper
function fzf-process-result
  if [ (cat $TMPDIR/fzf.result | wc -l) -gt 0 ]
    set -g FZFRESULT (cat $TMPDIR/fzf.result)
    and echo $FZFRESULT
    rm -f $TMPDIR/fzf.result
    return 0
  else
    set -e FZFRESULT
    rm -f $TMPDIR/fzf.result
    return 1
  end
end

# Store in Variable

# File
function fzf-file
  fzf > $TMPDIR/fzf.result
  fzf-process-result
end

# Directory
function fzf-directory
  find * -type d | fzf  > $TMPDIR/fzf.result
  fzf-process-result
end

# Use from variable
function fzf-result-vim
  test -n "$FZFRESULT"
  and vim "$FZFRESULT"
end
function fzf-result-cd
  test -n "$FZFRESULT"
  and cd "$FZFRESULT"
end

# Directories

# cd
function fzf-directory-cd
  find * -type d | fzf  > $TMPDIR/fzf.result
  set result (fzf-process-result)
  and cd $result
end


# Files

# emacs
function fzf-file-emacs
  fzf | xargs -o emacs
end

# vim
function fzf-file-vim
  fzf | xargs -o vim
end

# mate
function fzf-file-mate
  fzf | xargs mate
end

# reveal
function fzf-file-reveal
  fzf | xargs open -R
end

# open
function fzf-file-open
  fzf | xargs open
end

# Lines

# vim
function fzf-line-vim
  ag --nocolor --nobreak --noheading "[a-zA-Z0-9]+" . | fzf > $TMPDIR/fzf.result
  set result (fzf-process-result)
  and echo $result | vim -c "GrepBuffer" - 
end

# Bookmarks

# cd to bookmark
# Basic
set -x RKBOOKMARKS ~/Dotfiles/ ~/Development/ ~/Development/Scratch/ ~/Development/Projects/ ~/Dropbox/Text/ ~/Dropbox/Scratch/
# Vim
set -x RKBOOKMARKS $RKBOOKMARKS ~/Dotfiles/vim/plugged/ ~/Dotfiles/vim/robenkleene/ ~/Dotfiles/vim/after/
# Fish
set -x RKBOOKMARKS $RKBOOKMARKS ~/Dotfiles/config/fish/
# Copy with a `:` separator for more portability for other shells
set -x ROBENKLEENE_BOOKMARKS (echo -s :$RKBOOKMARKS | cut -b 2-)
function fzf-bookmark-cd
  printf '%s\n' $RKBOOKMARKS | fzf  > $TMPDIR/fzf.result
  set result (fzf-process-result)
  and cd $result
end

# Snippets

# Copy
function fzf-snippet
  fzf-snippet-copy
end

function fzf-snippet-copy
  cd ~/Development/Snippets/
  find * -type f | fzf | xargs cat | tee /dev/tty | pbcopy
  cd -
end

# Reveal
function fzf-snippet-reveal
  cd ~/Development/Snippets/
  find * -type f | fzf | xargs open -R
  cd -
end

# TextMate
function fzf-snippet-mate
  cd ~/Development/Snippets/
  find * -type f | fzf | xargs mate
  cd -
end

# vim
function fzf-snippet-vim
  cd ~/Development/Snippets/
  find * -type f | fzf | xargs -o vim
  cd -
end

# Project

# fzf Xcode

function fzf-project-xcode
  find . -path '*.xcodeproj' -prune -o -name '*.xcworkspace' -o -name '*.xcodeproj' | grep -vE "\/Carthage\/" | fzf | tr '\n' '\0' | xargs -0 open
end
