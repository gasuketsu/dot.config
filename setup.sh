#! /usr/bin/env bash

CWD=$PWD

asdf_version=v0.7.8

declare -A asdf_tool_versions
asdf_tool_versions["python"]=3.8.5
asdf_tool_versions["golang"]=1.14.7
asdf_tool_versions["nodejs"]=12.18.3
asdf_tool_versions["bat"]=0.15.4
asdf_tool_versions["fd"]=8.1.1

pip_packages=("pip" "pipenv" "black" "flake8" "jedi")


function setup_win32yank () {
    # set .nvimrc_local if no clipboard configuration
    if type win32yank.exe > /dev/null; then
        if [ ! -f ~/.nvimrc_local ] || ! grep 'let :g:clipboard' ~/.nvimrc_local > /dev/null 2>&1; then
            echo "#### setting up neovim clipboard to use win32yank..."
            cat <<EOT >> ~/.nvimrc_local
let g:clipboard = {
            \\    'name': 'win32yank',
            \\    'copy': {
            \\        '+': 'win32yank.exe -i',
            \\        '*': 'win32yank.exe -i',
            \\    },
            \\   'paste': {
            \\        '+': 'win32yank.exe -o',
            \\        '*': 'win32yank.exe -o',
            \\    },
            \\    'cache_enabled': 1,
            \\}
EOT
        fi
    fi
}


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

# tpm
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

# default golang packages (asdf-golang)
if [ ! -e ~/.default-golang-pkgs ]; then
    ln -s ~/.config/asdf/.default-golang-pkgs ~/.default-golang-pkgs
fi

# .gitconfig
if [ ! -e ~/.gitconfig ]; then
    touch ~/.gitconfig
fi

# lemonade
if [ ! -f ~/.config/lemonade.toml ]; then
    cp ~/.config/lemonade/default.toml ~/.config/lemonade.toml
fi

# install starship
mkdir -p ~/.local/bin
if [ ! -f ~/.local/bin/starship ]; then
    curl -fsSL https://starship.rs/install.sh | bash -s -- -b ~/.local/bin -y
fi

source ~/.config/rc.sh

# install tools
if [ -d ~/.asdf ]; then
    for tool in "${!asdf_tool_versions[@]}"; do
        ver=${asdf_tool_versions[$tool]}
        echo "#### (asdf) installing $tool $ver ..."
        asdf plugin-add $tool
        if [ $tool = "nodejs" ]; then
            # Import the Node.js release team's OpenPGP keys
            bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
        fi
        asdf install $tool $ver
        asdf global $tool $ver
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
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
pipenv --rm
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
setup_win32yank

# reshim again for enabling installed tools
asdf reshim

echo
echo "######################################################"
echo " Finished setup"
echo
echo " Make sure to add following line into your ~/.bashrc"
echo " source ~/.config/rc.sh"
echo "######################################################"
