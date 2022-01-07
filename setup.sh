#! /usr/bin/env bash

CWD=$PWD

# You can specify dict value as filter to install
# latest version in given filter
if [ ! -f "$HOME/.config/asdf/asdf_plugins" ]; then
  cp "$HOME/.config/asdf/asdf_plugins.default" "$HOME/.config/asdf/asdf_plugins"
fi

declare -A asdf_plugins
while IFS='=' read -r key value; do
  asdf_plugins["$key"]="$value"
done < "$HOME/.config/asdf/asdf_plugins"

# vim-plug (for neovim)
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

# default python packages (asdf-python)
if [ ! -e "$HOME/.default-npm-packages" ]; then
  ln -s "$HOME/.config/asdf/default-npm-packages" "$HOME/.default-npm-packages"
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

# (python) install pipx packages
echo "##### (python) (re)install pipx packages..."
export PATH="$HOME/.local/bin:$PATH"
if [ ! -f "$HOME/.config/pipx/pipx_packages" ]; then
  cp "$HOME/.config/pipx/pipx_packages.default" "$HOME/.config/pipx/pipx_packages"
fi
while read -r pkg; do
  pipx install --force $pkg
done < "$HOME/.config/pipx/pipx_packages"

# (python) venv for nvim python bindings
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
cd "$HOME/.config/nvim/py3nvim"
pipenv --rm
pipenv install
cd $CWD

# (golang) set go env configuration
if [ -z `go env GOBIN` ]; then
  echo "##### (golang) set GOBIN where 'go install' installs binaries"
  go env -w GOBIN="$HOME/.local/bin"
fi


echo
echo "######################################################"
echo " Finished setup"
echo
echo " To enable configuration in bash, make sure to add"
echo " following line into your ~/.profile or ~/.bashrc"
echo " source ~/.config/bash/config.bash"
echo "######################################################"
