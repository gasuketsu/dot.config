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
    curl https://mise.jdx.dev/install.sh | sh
fi

# default python packages
if [ ! -e "$HOME/.default-python-packages" ]; then
    cp "$HOME/.config/mise/default-python-packages" "$HOME/.default-python-packages"
fi
# default golang packages
if [ ! -e "$HOME/.default-go-packages" ]; then
    cp "$HOME/.config/mise/default-go-packages" "$HOME/.default-go-packages"
fi
# default npm packages
if [ ! -e "$HOME/.default-npm-packages" ]; then
    cp "$HOME/.config/mise/default-npm-packages" "$HOME/.default-npm-packages"
fi

source "$HOME/.config/bash/rc.bash"
# install tools
mise install -y
# generate completions
mise completion fish >~/.config/fish/completions/mise.fish

# (python) reinstall existing pipx packages
echo "##### (python) reinstall existing pipx packages..."
mise exec python --command "pipx reinstall-all"

# (python) install default pipx packages
echo "##### (python) install default pipx packages..."
export PATH="$HOME/.local/bin:$PATH"
while read -r pkg; do
    mise exec python --command "pipx install $pkg"
done <"$HOME/.config/pipx/pipx_packages"

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
