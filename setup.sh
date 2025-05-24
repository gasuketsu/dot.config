#! /usr/bin/env bash

CWD=$PWD

mkdir -p "$HOME/.local/bin"

# Fisher
if type fish >/dev/null 2>&1 && ! fish -c "type fisher" >/dev/null 2>&1; then
    fish -c "curl -skL https://git.io/fisher | source && fisher update"
fi
# clang-format
if [ ! -e "$HOME/.clang-format" ]; then
    cp "$HOME/.config/clang-format/clang-format" "$HOME/.clang-format"
fi
# .gitconfig
if [ ! -e "$HOME/.gitconfig" ]; then
    touch "$HOME/.gitconfig"
fi
# EditorConfig
if [ ! -e "$HOME/.editorconfig" ]; then
    cp "$HOME/.config/editorconfig/editorconfig" "$HOME/.editorconfig"
fi

# mise
if ! type mise >/dev/null 2>&1; then
    curl https://mise.run | sh
fi

# default python packages
if [ ! -e "$HOME/.default-python-packages" ]; then
    cp "$HOME/.config/mise/default-python-packages" "$HOME/.default-python-packages"
fi
# default golang packages
if [ ! -e "$HOME/.default-go-packages" ]; then
    cp "$HOME/.config/mise/default-go-packages" "$HOME/.default-go-packages"
fi
# default go env (only when no env file exist)
if [ ! -f "$HOME/.config/go/env" ]; then
    mkdir -p "$HOME/.config/go"
    echo "GOBIN=$HOME/.local/bin" >"$HOME/.config/go/env"
fi

source "$HOME/.config/bash/rc.bash"

# Ensure python and pipx are available
mise install -y python
mise exec python --command "pip install --user --upgrade pipx"

# install remaining tools
mise install -y
# generate completions
mise completion fish >~/.config/fish/completions/mise.fish

# update fish completions
if type fish >/dev/null 2>&1; then
    fish -c "fish_update_completions"
fi

# (python) venv for nvim python bindings
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
cd "$HOME/.config/nvim/py3nvim"
mise exec python --command "pipenv --rm"
mise exec python --command "pipenv lock"
mise exec python --command "pipenv install"
cd $CWD

# (bat) rebuild cache
echo "##### (bat) rebuild cache..."
mise exec bat --command "bat cache --build"

echo
echo "######################################################"
echo " Finished setup"
echo
echo " To enable configuration in bash, make sure to add"
echo " following line into your ~/.profile or ~/.bashrc"
echo " source ~/.config/bash/rc.bash"
echo "######################################################"
