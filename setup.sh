#! /usr/bin/env bash

asdf_version=v0.7.5
asdf_python_version=3.8.0
asdf_golang_version=1.13.4
asdf_nodejs_version=12.13.1

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

# .gitconfig
if [ ! -e ~/.gitconfig ]; then
    touch ~/.gitconfig
fi

source ~/.config/rc.sh

# install languages
if [ -d ~/.asdf ]; then
    # python
    if ! asdf plugin-list | grep python > /dev/null; then
        echo "##### (asdf) installing python $asdf_python_version ..."
        asdf plugin-add python
        asdf install python $asdf_python_version
        asdf global python $asdf_python_version
    fi
    # golang
    if ! asdf plugin-list | grep golang > /dev/null; then
        echo "##### (asdf) installing golang $asdf_golang_version ..."
        asdf plugin-add golang
        asdf install golang $asdf_golang_version
        asdf global golang $asdf_golang_version
    fi
    # nodejs
    if ! asdf plugin-list | grep nodejs > /dev/null; then
        echo "##### (asdf) installing golang $asdf_nodejs_version ..."
        asdf plugin-add nodejs
        bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
        asdf install nodejs $asdf_nodejs_version
        asdf global nodejs $asdf_nodejs_version
    fi
    # make sure shims are up to date
    asdf reshim
fi

# (python) pip
if ! pip show pipenv > /dev/null; then
    echo "##### (python) install/update must-have packages..."
    pip install -U pip pipenv black flake8 python-language-server
    asdf reshim
fi

# (python) venv for nvim python bindings
echo "##### (python) setting up virtualenv for neovim python bindings..."
cd ~/.config/nvim/py3nvim && pipenv install --dev
py3nvim_venv=`cd ~/.config/nvim/py3nvim && pipenv --venv`
if [ ! -f ~/.nvimrc_local ]; then
    echo "let g:python3_host_prog = "\'"${py3nvim_venv}/bin/python"\' >> ~/.nvimrc_local
    echo "let g:black_virtualenv = "\'"${py3nvim_venv}"\' >> ~/.nvimrc_local
else
    if ! grep 'let g:python3_host_prog' ~/.nvimrc_local > /dev/null 2>&1; then
        echo "let g:python3_host_prog = "\'"${py3nvim_venv}/bin/python"\' >> ~/.nvimrc_local
    fi
    if ! grep 'let g:black_virtualenv' ~/.nvimrc_local > /dev/null 2>&1; then
        echo "let g:black_virtualenv = "\'"${py3nvim_venv}"\' >> ~/.nvimrc_local
    fi
fi

# (go) enable GO111MODULE if not set
go_module=`go env GO111MODULE`
if [ -z $go_module ]; then
    echo "##### (go) setting GO111MODULE=on"
    go env -w GO111MODULE=on
fi

echo
echo "######################################################"
echo " Finished setup"
echo
echo " Make sure to add following line into your ~/.bashrc"
echo " source ~/.config/rc.sh"
echo "######################################################"
