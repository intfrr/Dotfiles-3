# Configuration

# Fisherman
# To setup, install fisherman and plugins:
# bass
# fasd
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# fzf
source ~/.config/fish/fzf.fish

# local fish config
source ~/.config.fish

# Greeting
set --erase fish_greeting

# Path
set -x PATH /usr/local/bin ~/Development/Scripts/bin $PATH

# Editor
set -x EDITOR vim

# Prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set fish_color_comment 3a3a3a
function fish_prompt
  set_color $fish_color_comment
  echo -n (date "+%I:%M %p")
  echo -n ' '
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n '> '
end
function fish_right_prompt
  echo -n (__fish_git_prompt)
end

# rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# ag
alias ag "ag --path-to-agignore ~/.agignore"

# Atom
set -x ATOM_PATH $HOME/Applications/
set -x ATOM_REPOS_HOME $HOME/Development/Projects/Atom

# Coffeelint
set -x COFFEELINT_CONFIG $HOME/.coffeelint.json

# Fish
set -x FISH_CONFIG_PATH $HOME/Dotfiles/config/fish/config.fish

# nvm
# Relies on `bass` as a dependency
function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end
function nvm-use-default
  nvm use default
end
set PATH $HOME/.nvm/versions/node/v0.12.2/bin $PATH

# Emacs
# Start the server in the background if it isn't running
set -x ALTERNATE_EDITOR ""


# Startup

# Emacs
# Test if server is running
function is-emacs-server-running
  ps -u $USER | grep 'emacs --daemon' | grep --silent -v grep
end
# Display a greeting message if the server is running
if is-emacs-server-running
  echo Emacs server is running
else
end
function emacs-stop-server
  emacsclient -e '(kill-emacs)'
end

# tmux
# Echo running sessions if there are any
if tmux ls >/dev/null 2>/dev/null
  if test -z "$TMUX"
    echo tmux sessions
    tmux ls
  end
end


# Functions

# Quick
function n
  new-terminal-here
end
function o
  new-finder-window-here
end
function r
  ranger-cd
end
function t
  tmux $argv
end
function -
  cd -
end
function ts
  tig status +3
end
function ec
  emacsclient -t $argv
end
function v
  if count $argv > /dev/null
    vim $argv
  else
    vim .
  end
end
# fzf
function b
  fzf-bookmark-cd
end
function f
  fzf-file-vim
end
function fd
  fzf-directory-cd
end

# Vim
function vim-restore-session
  vim -c "RestoreSession"
end
function vim-pipe-grep
  # A more portable solution:
  # vim -c "setlocal buftype=nofile bufhidden=hide noswapfile" -c "cbuffer" -c "cw"
  if [ $argv[1] ]
    ag $argv[1] | vim -c "GrepBuffer" -c "let @/='$argv[1]' | set hlsearch" -
  else
    vim -c "GrepBuffer" -
  end

end
function git-vim-modified
  vim (git ls-files -m | uniq)
end
function git-submodule-update-init-recursive
  git submodule update --init --recursive
end

# Git
function git-reveal-diff
  git diff --name-only -z | xargs -0 open -R
end
function git-cd-root
  cd (git rev-parse --show-toplevel)
end
function git-push-branch-origin
  git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)
end
function git-remote-add-origin
  git remote rm origin
  git remote add origin $argv[1]
end
function git-remote-prune-origin
  git remote prune origin
end
function git-log-unpushed-commits
  git log @\{u\}..
end
function git-diff-dirty
  git diff --name-only --diff-filter=UM
end
# Open unmerged files in Vim
function git-vim-dirty
  sh -c "vim \$(git diff --name-only --diff-filter=UM)"
end
function git-difftool-commit-minus-one
  git difftool $argv[1]^!
end
function git-diff-commit-minus-one
  git diff $argv[1]^!
end

# Git Stash
function git-stash-command
  set cmd[1] "git stash $argv[1]"
  set -e argv[1]
  if [ $argv[1] ]
    set cmd $cmd stash@\\\{$argv[1]\\\}
    set -e argv[1]
    set cmd $cmd $argv
  end
  eval $cmd
end
function git-stash-pop
  git-stash-command "pop" $argv
end
function git-stash-apply
  git-stash-command "apply" $argv
end
function git-stash-show
  git-stash-command "show" $argv
end
function git-stash-diff
  git-stash-command "show --patch" $argv
end
function git-stash-drop
  git-stash-command "drop" $argv
end



# egit
function egitn
  set --local EGITNEXT (egit -n)
  if test -n "$EGITNEXT"
    cd $EGITNEXT
    git status
  end
end

# Ranger
function ranger-cd
  set tempfile '/tmp/chosendir'
  ranger --choosedir=$tempfile (pwd)
  if test -f $tempfile
    if [ (cat $tempfile) != (pwd) ]
      cd (cat $tempfile)
    end
  end
  rm -f $tempfile
end

# Misc
function clean-open-with
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
end

# BBEdit
function bbfind-gui-grep-case
  bbfind --grep --gui --case-sensitive $argv .
end
function bbfind-gui-grep
  bbfind --grep --gui $argv .
end
function bbfind-gui-grep-case-name
  bbfind --grep --gui --case-sensitive --name-pattern "$argv[1]" "$argv[2]" .
end

# Gem
function gem-update-no-doc
  gem update --no-ri --no-rdoc
end

# Jekyll
function jekyll-build-watch
  bundle exec jekyll build --watch
end
function jekyll-build-watch-drafts
  bundle exec jekyll build --watch --drafts
end
function jekyll-serve-watch
  # The `--open-url` version isn't supported by `gh-pages` jekyll yet
  bundle exec jekyll serve --watch
end
function jekyll-serve-watch-drafts
  # The `--open-url` version isn't supported by `gh-pages` jekyll yet
  bundle exec jekyll serve --watch --drafts
end

# Web Console

# wcsearch
# function sea
#   wcsearch $argv
# end

function edit_cmd --description 'Input command in external editor'
  set -l tempfile (mktemp /tmp/fish.cmd.XXXXXXXX)
  and test -n "$tempfile"
  and set -l cursorposition (commandline -C)
  and commandline -b > $tempfile
  and vim -c 'set ft=fish' $tempfile
  and set -l edited (cat $tempfile)
  and test -n "$edited"
  and commandline -r $edited
  and commandline -C $cursorposition
  and command rm $tempfile
end

function fish_user_key_bindings
  # Better binding but I can't get this to work
  # bind \cx\ce 'edit_cmd'
  bind \ee 'edit_cmd'
end
