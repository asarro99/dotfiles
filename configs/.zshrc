# ZSH config folder
export ZSH=$HOME/.config/zsh

# Default editor
export EDITOR=nvim

# Source config
[[ -f $ZSH/config/aliases.zsh ]] && source $ZSH/config/aliases.zsh
[[ -f $ZSH/config/history.zsh ]] && source $ZSH/config/history.zsh

# Source plugins
[[ -f $ZSH/plugins/init.zsh ]] && source $ZSH/plugins/init.zsh

eval "$(starship init zsh)"