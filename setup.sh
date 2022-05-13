#! /usr/bin/env bash

CWD=$PWD

declare -A asdf_plugins
while IFS='=' read -r key value; do
  asdf_plugins["$key"]="$value"
done < "$HOME/.config/asdf/asdf_plugins"

# packer.nvim (for neovim plugin management)
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
fi

# Fisher
if type fish > /dev/null 2>&1 && ! fish -c "type fisher" > /dev/null 2>&1; then
  fish -c "curl -skL https://git.io/fisher | source && fisher update"
fi

# tpm
if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

# clang-format
if [ ! -e "$HOME/.clang-format" ]; then
  ln -s "$HOME/.config/clang-format/clang-format" "$HOME/.clang-format"
fi

# asdf
if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf"
fi

if [ ! -e "$HOME/.config/fish/completions/asdf.fish" ]; then
  mkdir -p "$HOME/.config/fish/completions"
  ln -s "$HOME/.asdf/completions/asdf.fish" "$HOME/.config/fish/completions"
fi

# EditorConfig
if [ ! -e "$HOME/.editorconfig" ]; then
  ln -s "$HOME/.config/editorconfig/editorconfig" "$HOME/.editorconfig"
fi

# default python packages (asdf-python)
if [ ! -e "$HOME/.default-python-packages" ]; then
  ln -s "$HOME/.config/asdf/default-python-packages" "$HOME/.default-python-packages"
fi

# default golang packages (asdf-golang)
if [ ! -e "$HOME/.default-golang-pkgs" ]; then
  ln -s "$HOME/.config/asdf/default-golang-pkgs" "$HOME/.default-golang-pkgs"
fi

# default npm packages (asdf-nodejs)
if [ ! -e "$HOME/.default-npm-packages" ]; then
  ln -s "$HOME/.config/asdf/default-npm-packages" "$HOME/.default-npm-packages"
fi

# .gitconfig
if [ ! -e "$HOME/.gitconfig" ]; then
  touch "$HOME/.gitconfig"
fi

# default go env (only when no env file exist)
if [ ! -f "$HOME/.config/go/env" ]; then
  echo "GOBIN=$HOME/.local/bin" > "$HOME/.config/go/env"
fi

source "$HOME/.config/bash/config.bash"

# update asdf to latest stable release
asdf update

# install tools
if [ -d "$HOME/.asdf" ]; then
  # update installed plugins
  asdf plugin-update --all

  for plugin in "${!asdf_plugins[@]}"; do
    echo "#### (asdf) installing plugin $plugin ..."
    asdf plugin-add $plugin
    filter="${asdf_plugins[$plugin]}"
    version=$(asdf latest $plugin "$filter")
    echo "#### (asdf) installing $plugin $version..."
    asdf install $plugin $version
    asdf global $plugin $version
  done
fi

# (python) install pipx packages
echo "##### (python) (re)install pipx packages..."
export PATH="$HOME/.local/bin:$PATH"
while read -r pkg; do
  pipx install --force $pkg
done < "$HOME/.config/pipx/pipx_packages"

# (python) venv for nvim python bindings
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
cd "$HOME/.config/nvim/py3nvim"
pipenv --rm
pipenv install
cd $CWD

echo
echo "######################################################"
echo " Finished setup"
echo
echo " To enable configuration in bash, make sure to add"
echo " following line into your ~/.profile or ~/.bashrc"
echo " source ~/.config/bash/config.bash"
echo "######################################################"
