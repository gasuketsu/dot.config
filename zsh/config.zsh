if [ -f ~/.environment ]; then
    export $(envsubst <~/.environment)
fi

fpath+=($HOME/.config/zsh/functions)
autoload -Uz gcp

export PIPENV_VENV_IN_PROJECT=1
export FZF_DEFAULT_OPTS_FILE=~/.config/fzf/config

if [ -d $HOME/.local/bin ] && ! echo $PATH | grep -q "$HOME/.local/bin"; then
    export PATH=$HOME/.local/bin:$PATH
fi

eval "$(sheldon source)"

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
