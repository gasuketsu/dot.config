if [ -f ~/.environment ]; then
    export $(envsubst <~/.environment)
fi

export PIPENV_VENV_IN_PROJECT=1
export FZF_DEFAULT_OPTS_FILE=~/.config/fzf/config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#54546d"

if [ -d $HOME/.local/bin ] && ! echo $PATH | grep -q "$HOME/.local/bin"; then
    export PATH=$HOME/.local/bin:$PATH
fi

eval "$(sheldon source)"
eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"

if type fzf >/dev/null 2>&1; then
    source <(fzf --zsh)

    if [ -f ~/.local/share/fzf-git/fzf-git.sh ]; then
        source ~/.local/share/fzf-git/fzf-git.sh
    fi
fi

fpath=($HOME/.config/zsh/functions "${fpath[@]}")
autoload -Uz gcp
autoload -Uz _mise
compdef _mise mise

eval "$(starship init zsh)"
