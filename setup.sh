#! /usr/bin/env bash

CWD=$PWD

asdf_version=v0.7.8

declare -A asdf_lang_versions
asdf_lang_versions["python"]=3.8.3
asdf_lang_versions["golang"]=1.14.3
asdf_lang_versions["nodejs"]=12.17.0

pip_packages=("pip" "pipenv" "black" "flake8")

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
    ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
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

if [ ! -e ~/.config/fish/completions/asdf.fish ]; then
    mkdir -p ~/.config/fish/completions
    ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
fi

# EditorConfig
if [ ! -e ~/.editorconfig ]; then
    ln -s ~/.config/editorconfig/.editorconfig ~/.editorconfig
fi

# .gitconfig
if [ ! -e ~/.gitconfig ]; then
    touch ~/.gitconfig
fi

# lemonade
if [ ! -f ~/.config/lemonade.toml ]; then
    cp ~/.config/lemonade/default.toml ~/.config/lemonade.toml
fi

source ~/.config/rc.sh

# install languages
if [ -d ~/.asdf ]; then
    for lang in "${!asdf_lang_versions[@]}"; do
        ver=${asdf_lang_versions[$lang]}
        echo "#### (asdf) installing $lang $ver ..."
        asdf plugin-add $lang
        if [ $lang = "nodejs" ]; then
            # Import the Node.js release team's OpenPGP keys
            bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
        fi
        asdf install $lang $ver
        asdf global $lang $ver
    done
    # update installed plugins
    asdf plugin-update --all
    # make sure shims are up to date
    asdf reshim
fi

# (python) pip
echo "##### (python) install/update must-have packages..."
pip install -U ${pip_packages[@]}
asdf reshim

# (python) venv for nvim python bindings
cd ~/.config/nvim/py3nvim
echo "##### (python) setting up virtualenv for neovim python bindings..."
pipenv install --dev

py3nvim_venv=`pipenv --venv`
if [ ! -f ~/.nvimrc_local ]; then
    echo "let g:python3_host_prog = "\'"${py3nvim_venv}/bin/python"\' >> ~/.nvimrc_local
else
    if ! grep 'let g:python3_host_prog' ~/.nvimrc_local > /dev/null 2>&1; then
        echo "let g:python3_host_prog = "\'"${py3nvim_venv}/bin/python"\' >> ~/.nvimrc_local
    fi
fi
cd $CWD

# (go) enable GO111MODULE if not set
go_module=`go env GO111MODULE`
if [ -z $go_module ]; then
    echo "##### (go) setting GO111MODULE=on"
    go env -w GO111MODULE=on
fi

echo "##### (go) install must-have packages..."
go get golang.org/x/tools/gopls@latest
go get github.com/lemonade-command/lemonade

# reshim again for enabling installed tools
asdf reshim

echo
echo "######################################################"
echo " Finished setup"
echo
echo " Make sure to add following line into your ~/.bashrc"
echo " source ~/.config/rc.sh"
echo "######################################################"
