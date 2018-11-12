#! /usr/bin/env bash

# vim-plug (for neovim)
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Fisherman
if [ ! -f ~/.config/fish/functions/fisher.fish ]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fi

# tmux
if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# asdf
if [ ! -d ~/.asdf ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0
fi
