# Utils
alias c='clear'
alias nf='neofetch'
alias ch='rm -f $ZSH/.zsh_history && kill -9 $$'

# Eza
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# Edit dotfiles
alias dot='$EDITOR ~/Projects/dotfiles'

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"

# Notes
alias notes='$EDITOR ~/notes.txt'