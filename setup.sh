#! /usr/bin/env bash

CWD=$PWD

# You can specify dict value as filter to install
# latest version in given filter
declare -A asdf_plugins=(
  ["python"]=""
  ["golang"]=""
  ["nodejs"]="14.*"
  ["neovim"]=""
  ["starship"]=""
  ["tmux"]=""
  ["bat"]=""
  ["fd"]=""
)


# vim-plug (for neovim)
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Fisher
if type fish > /dev/null 2>&1 && ! fish -c "type fisher" > /dev/null 2>&1; then
  fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
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

# .gitconfig
if [ ! -e "$HOME/.gitconfig" ]; then
  touch "$HOME/.gitconfig"
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
    if [ $plugin = "nodejs" ]; then
      # Import the Node.js release team's OpenPGP keys
      bash "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"
    fi
    filter="${asdf_plugins[$plugin]}"
    version=$(asdf latest $plugin "$filter")
    echo "#### (asdf) installing $plugin $version..."
    asdf install $plugin $version
    asdf global $plugin $version
  done
fi

# (python) venv for nvim python bindings
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
cd "$HOME/.config/nvim/py3nvim"
pipenv --rm
pipenv install
cd $CWD

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
echo " To enable configuration in bash, make sure to add"
echo " following line into your ~/.profile or ~/.bashrc"
echo " source ~/.config/bash/config.bash"
echo "######################################################"
