export EDITOR="nvim"
export PIPENV_VENV_IN_PROJECT=1
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height 90% --layout=reverse --color=fg:#dcd7ba,bg:#181616,hl:#6f894e --color=fg+:#f2ecbc,bg+:#282727,hl+:#98bb6c --color=info:#7fb4ca,prompt:#e6c384,pointer:#ff5d62 --color=marker:#938aa9,spinner:#7aa89f,header:#625e5a"

if [ -d $HOME/.local/bin ] && ! echo $PATH | grep -q "$HOME/.local/bin"; then
    export PATH=$HOME/.local/bin:$PATH
fi

eval "$(mise activate bash)"
