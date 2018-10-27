#! /usr/bin/env bash

# vim-plug (for neovim)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs \
  https://git.io/fisher

# tmux-tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
