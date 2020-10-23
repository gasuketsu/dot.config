export EDITOR="nvim"
export PIPENV_VENV_IN_PROJECT=1

if [ -d $HOME/.local/bin ] && ! echo $PATH | grep -q "$HOME/.local/bin"; then
  export PATH=$HOME/.local/bin:$PATH
fi

# fzf
[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

# asdf
[ -f "$HOME/.asdf/asdf.sh" ] && source "$HOME/.asdf/asdf.sh"
