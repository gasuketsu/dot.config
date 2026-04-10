#! /usr/bin/env bash

CWD=$PWD

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share"

# Install devbox if needed.
if ! command -v devbox >/dev/null 2>&1; then
    curl -fsSL https://get.jetify.com/devbox | bash
fi

# pull devbox global default from remote
eval "$(devbox global shellenv)"
devbox global pull https://github.com/gasuketsu/devbox-global-default.git
devbox global install
eval "$(devbox global shellenv --preserve-path-stack -r)" && hash -r

# default go env (only when no env file exist)
if [ ! -f "$HOME/.config/go/env" ]; then
    mkdir -p "$HOME/.config/go"
    echo "GOBIN=$HOME/.local/bin" >"$HOME/.config/go/env"
fi

source "$HOME/.config/bash/config.bash"

# Install node, python and uv at first for installation of npm:* and pipx:* tools.
# Then, install remaining tools
mise install -y

# (python) venv for nvim python bindings
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
cd "$HOME/.config/nvim/py3nvim" || exit
uv venv --clear
uv sync
cd "$CWD" || exit

# (bat) rebuild cache
echo "##### (bat) rebuild cache..."
bat cache --build

echo
echo "######################################################"
echo " Finished setup"
echo
echo " To enable configuration in bash, make sure to add"
echo " following line into your ~/.bashrc"
echo " source ~/.config/bash/config.bash"
echo "######################################################"
