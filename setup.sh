#! /usr/bin/env bash

asdf_version=v0.7.2
asdf_python_version=3.7.3
asdf_golang_version=1.12.5
asdf_nodejs_version=12.4.0

# vim-plug (for neovim)
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Fisherman
if [ ! -f ~/.config/fish/functions/fisher.fish ]; then
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fi

# tmux
if [ ! -e ~/.tmux.conf ]; then
    ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf
fi

# tpgm
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# clang-format
if [ ! -e ~/.clang-format ]; then
    ln -s ~/.config/clang-format/.clang-format ~/.clang-format
fi

# asdf
if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $asdf_version
fi

if [ ! -f ~/.config/fish/completions/asdf.fish ]; then
    mkdir -p ~/.config/fish/completions
    cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
fi

# EditorConfig
if [ ! -e ~/.editorconfig ]; then
    ln -s ~/.config/editorconfig/.editorconfig ~/.editorconfig
fi

source ~/.config/rc.sh

# install languages
if [ -d ~/.asdf ]; then
    # python
    if ! asdf plugin-list | grep python > /dev/null; then
        echo "install python($asdf_python_version) with asdf..."
        asdf plugin-add python
        asdf install python $asdf_python_version
        asdf global python $asdf_python_version
    fi
    # golang
    if ! asdf plugin-list | grep golang > /dev/null; then
        echo "install golang($asdf_golang_version) with asdf..."
        asdf plugin-add golang
        asdf install golang $asdf_golang_version
        asdf global golang $asdf_golang_version
    fi
    # nodejs
    if ! asdf plugin-list | grep nodejs > /dev/null; then
        echo "install golang($asdf_nodejs_version) with asdf..."
        asdf plugin-add nodejs
        bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
        asdf install nodejjs $asdf_nodejs_version
        asdf global nodejs $asdf_nodejs_version
    fi
    # make sure shims are up to date
    asdf reshim
fi

# pipenv
if ! pip show pipenv > /dev/null; then
    echo "setup pipenv..."
    pip install pipenv
fi

# venv for nvim python bindings
if [ ! -d ~/.config/nvim/py3nvim/.venv ]; then
    echo "setup venv for neovim python bindings..."
    cd ~/.config/nvim/py3nvim && pipenv install --dev
fi


echo
echo "Make sure to add following line into your ~/.bashrc"
echo "source ~/.config/rc.sh"
echo
