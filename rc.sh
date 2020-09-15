export TERM=xterm-256color
export EDITOR="nvim"
export PIPENV_VENV_IN_PROJECT=1

if [ -d $HOME/.local/bin ] && ! echo $PATH | grep -q "$HOME/.local/bin"; then
  export PATH=$HOME/.local/bin:$PATH
fi

# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
  source $HOME/.asdf/asdf.sh
fi
