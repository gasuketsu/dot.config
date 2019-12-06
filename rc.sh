export TERM=xterm-256color
export EDITOR="nvim"

if [ -d $HOME/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

# fzf
if [ -f $HOME/.fzf.bash ]; then
    source $HOME/.fzf.bash
fi

# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
    source $HOME/.asdf/asdf.sh
fi
