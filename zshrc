# Enable Completion
autoload -Uz compinit promptinit
compinit

# Color in `ls`
export CLICOLOR=1

# Required for abbreviations
setopt extendedglob

# Highlight tab match
zstyle ':completion:*' menu select

# Plugins
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
# Syntax highlighting must be last
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug load

# External

# Setup
source ~/.zsh/settings.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/installs.zsh
# Interactive
source ~/.zsh/ui.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/bindings.zsh
source ~/.zsh/startup.zsh
source ~/.zsh/abbr.zsh
