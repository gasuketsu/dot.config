export TERM=xterm-256color
export EDITOR="nvim"
export PIPENV_VENV_IN_PROJECT=1

if [ -d $HOME/.local/bin ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

# yarn
if [ -d $HOME/.yarn/bin ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
  source $HOME/.asdf/asdf.sh
fi
