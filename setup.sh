#! /usr/bin/env bash

CWD=$PWD

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share"

# Sheldon
if ! type sheldon >/dev/null 2>&1; then
    curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh |
        bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
fi
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

# fzf-git
if [ ! -d "$HOME/.local/share/fzf-git" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf-git.sh.git "$HOME/.local/share/fzf-git"
else
    (cd "$HOME/.local/share/fzf-git" && git pull)
fi

# mise
if ! type mise >/dev/null 2>&1; then
    curl https://mise.run | sh
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

source "$HOME/.config/bash/config.bash"

# Install node, python and uv at first for installation of npm:* and pipx:* tools.
# Then, install remaining tools
mise install -y node python uv
mise install -y

# generate completions
mise completion fish >~/.config/fish/completions/mise.fish
echo 'uv generate-shell-completion fish | source' >~/.config/fish/completions/uv.fish

# update fish completions
if type fish >/dev/null 2>&1; then
    fish -c "fish_update_completions"
fi

# (python) venv for nvim python bindings
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
cd "$HOME/.config/nvim/py3nvim" || exit
mise exec python --command "uv venv --clear"
mise exec python --command "uv sync"
cd "$CWD" || exit

# (bat) rebuild cache
echo "##### (bat) rebuild cache..."
mise exec bat --command "bat cache --build"

echo
echo "######################################################"
echo " Finished setup"
echo
echo " To enable configuration in bash, make sure to add"
echo " following line into your ~/.bashrc"
echo " source ~/.config/bash/config.bash"
echo "######################################################"
