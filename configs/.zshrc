# ZSH config folder
export ZSH=$HOME/.config/zsh

# Default editor
export EDITOR=nvim

# Source config
[[ -f $ZSH/config/aliases.zsh ]] && source $ZSH/config/aliases.zsh
[[ -f $ZSH/config/history.zsh ]] && source $ZSH/config/history.zsh

# Source plugins
[[ -f $ZSH/plugins/init.zsh ]] && source $ZSH/plugins/init.zsh

# Source nvm
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# Souce fzf and fzf-git
[[ -f $ZSH/config/fzf.zsh ]] && source $ZSH/config/fzf.zsh

# Source starship
eval "$(starship init zsh)"