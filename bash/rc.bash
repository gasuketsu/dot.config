export EDITOR="nvim"
export PIPENV_VENV_IN_PROJECT=1
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height 90% --layout=reverse --color=fg:#e5d5ad,bg:#282828,hl:#959c36 --color=fg+:#f4e8be,bg+:#3c3836,hl+:#b0b846 --color=info:#80aa9e,prompt:#e9b143,pointer:#f2594b --color=marker:#b36e81,spinner:#749e69,header:#665c54"

if [ -d $HOME/.local/bin ] && ! echo $PATH | grep -q "$HOME/.local/bin"; then
  export PATH=$HOME/.local/bin:$PATH
fi

eval "$(rtx activate bash)"
