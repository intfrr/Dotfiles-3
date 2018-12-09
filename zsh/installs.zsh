# fasd
if [[ $(whence -p "fasd") ]]; then
  eval "$(fasd --init auto)"
fi

# chruby
if [[ "$(uname)" = "Darwin" ]]; then
  if [[ -f /usr/local/share/chruby/chruby.sh ]]; then
    source /usr/local/share/chruby/chruby.sh
    chruby ruby-2.5.3
  fi
elif [[ "$(uname)" = "Linux" ]]; then
  if [[ -f /home/linuxbrew/.linuxbrew/opt/chruby/share/chruby/chruby.sh ]]; then
    source /home/linuxbrew/.linuxbrew/opt/chruby/share/chruby/chruby.sh
    chruby ruby-2.5.3
  fi
fi

# export PATH=$HOME/.rubies/ruby-2.4.0/bin:$PATH
# export PATH=$HOME/.gem/ruby/2.4.0/bin:$PATH

# nvm
# Official installation is really slow:
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# This is faster:
nvm() {
  if [[ -f ~/.nvm/nvm.sh ]]; then
    source ~/.nvm/nvm.sh
    nvm "$@"
  fi
}
export PATH=$HOME/.nvm/versions/node/v11.4.0/bin:$PATH
