[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path(){
    fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir(){
    fd --type=d --hidden --exclude .git . "$1"
}

[[ -f $ZSH/plugins/fzf-git.sh/fzf-git.sh ]] && source $ZSH/plugins/fzf-git.sh/fzf-git.sh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun(){
    local command=$1
    shift

    case "$command" in
        cd)             fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset)   fzf --preview "eval 'echo \$' {}" "$@" ;;
        ssh)            fzf --preview 'dig {}' "$@" ;;
        *)              fzf --preview "--preview 'bat -n -color=always --line-range :500 {}'" "$@" ;;
    esac
}

export BAT_THEME="OneHalfDark"