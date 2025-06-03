if [ -f ~/.environment ]; then
    export $(envsubst <~/.environment)
fi

export PIPENV_VENV_IN_PROJECT=1

if [ -d $HOME/.local/bin ] && ! echo $PATH | grep -q "$HOME/.local/bin"; then
    export PATH=$HOME/.local/bin:$PATH
fi

# enable skim key-bindings and completion if available
if [ -d ~/.skim ] && command -v sk >/dev/null; then
    source ~/.skim/shell/key-bindings.bash
    source <(sk --shell bash)
fi

eval "$(mise activate bash)"
