#! /usr/bin/env bash

CWD=$PWD

asdf_plugins=(
  "python"
  "golang"
  "nodejs"
  "neovim"
  "starship"
  "tmux"
  "bat"
  "fd"
)

golang_default_packages=(
  "golang.org/x/tools/gopls@latest"
  "github.com/lemonade-command/lemonade"
  "github.com/swaggo/swag/cmd/swag"
  "github.com/jstemmer/go-junit-report"
)

function install_win32yank () {
  if [ "$(uname -r | grep -i "microsoft")" != "" ] && ! type win32yank.exe >& /dev/null; then
    local download_url="https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip"
    local download_dir="/tmp/$USER"
    mkdir -p $download_dir
    mkdir -p "$HOME/.local/bin"
    curl -fLo "$download_dir/win32yank.zip" $download_url
    unzip "$download_dir/win32yank.zip" "win32yank.exe" -d "$HOME/.local/bin"
    chmod 755 "$HOME/.local/bin/win32yank.exe"
    rm -f "$download_dir/win32yank.zip"
  fi
}

function setup_neovim_clipboard_config () {
  # set .nvimrc_local if no clipboard configuration
  if [ "$(uname -r | grep -i "microsoft")" != "" ] && type win32yank.exe >& /dev/null; then
    if [ ! -f "$HOME/.nvimrc_local" ] || ! grep 'let g:clipboard' "$HOME/.nvimrc_local" >& /dev/null; then
      echo "#### setting up neovim clipboard to use win32yank..."
      cat <<EOT >> "$HOME/.nvimrc_local"
let g:clipboard = {
      \\   'name': 'win32yank',
      \\   'copy': {
      \\     '+': 'win32yank.exe -i',
      \\     '*': 'win32yank.exe -i',
      \\   },
      \\   'paste': {
      \\     '+': 'win32yank.exe -o',
      \\     '*': 'win32yank.exe -o',
      \\   },
      \\   'cache_enabled': 1,
      \\ }
EOT
    fi
  fi
}


# vim-plug (for neovim)
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Fisherman
if [ ! -f "$HOME/.config/fish/functions/fisher.fish" ]; then
  curl -Lo "$HOME/.config/fish/functions/fisher.fish" --create-dirs https://git.io/fisher
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

# .gitconfig
if [ ! -e "$HOME/.gitconfig" ]; then
  touch "$HOME/.gitconfig"
fi

# lemonade
if [ ! -f "$HOME/.config/lemonade.toml" ]; then
  cp "$HOME/.config/lemonade/default.toml" "$HOME/.config/lemonade.toml"
fi

source "$HOME/.config/bash/config.bash"

# update asdf to latest stable release
asdf update

# install tools
if [ -d "$HOME/.asdf" ]; then
  for plugin in "${asdf_plugins[@]}"; do
    echo "#### (asdf) installing plugin $plugin ..."
    asdf plugin-add $plugin
    if [ $plugin = "nodejs" ]; then
      # Import the Node.js release team's OpenPGP keys
      bash "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"
    fi
    version=$(asdf latest $plugin)
    echo "#### (asdf) installing $plugin $version..."
    asdf install $plugin $version
    asdf global $plugin $version
  done
  # update installed plugins
  asdf plugin-update --all
  # make sure shims are up to date
  asdf reshim
fi

# (python) venv for nvim python bindings
cd "$HOME/.config/nvim/py3nvim"
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
pipenv --rm
pipenv install

py3nvim_venv=`pipenv --venv`
if [ ! -f "$HOME/.nvimrc_local" ]; then
  echo "let g:python3_host_prog = "\'"${py3nvim_venv}/bin/python"\' >> "$HOME/.nvimrc_local"
else
  if ! grep 'let g:python3_host_prog' "$HOME/.nvimrc_local" >& /dev/null; then
    echo "let g:python3_host_prog = "\'"${py3nvim_venv}/bin/python"\' >> "$HOME/.nvimrc_local"
  fi
fi
cd $CWD

# (go) enable GO111MODULE if not set
go_module=`go env GO111MODULE`
if [ -z $go_module ]; then
  echo "##### (go) setting GO111MODULE=on"
  go env -w GO111MODULE=on
fi

echo "##### (go) install default packages..."
for pkg in "${golang_default_packages[@]}"; do
  go get $pkg
done

install_win32yank
setup_neovim_clipboard_config

# reshim again for enabling installed tools
asdf reshim

echo
echo "######################################################"
echo " Finished setup"
echo
echo " To enable configuration in bash, make sure to add"
echo " following line into your ~/.profile or ~/.bashrc"
echo " source ~/.config/bash/config.bash"
echo "######################################################"
