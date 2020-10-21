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

function setup_neovim_clipboard_config () {
  # set .nvimrc_local if no clipboard configuration
  if [ "$(uname -r | grep -i "microsoft")" != "" ] && type win32yank.exe > /dev/null; then
    if [ ! -f ~/.nvimrc_local ] || ! grep 'let g:clipboard' ~/.nvimrc_local > /dev/null 2>&1; then
      echo "#### setting up neovim clipboard to use win32yank..."
      cat <<EOT >> ~/.nvimrc_local
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
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Fisherman
if [ ! -f ~/.config/fish/functions/fisher.fish ]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fi

# tpm
if [ ! -d ~/.config/tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi

# clang-format
if [ ! -e ~/.clang-format ]; then
  ln -s ~/.config/clang-format/clang-format ~/.clang-format
fi

# asdf
if [ ! -d ~/.asdf ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

if [ ! -e ~/.config/fish/completions/asdf.fish ]; then
  mkdir -p ~/.config/fish/completions
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
fi

# EditorConfig
if [ ! -e ~/.editorconfig ]; then
  ln -s ~/.config/editorconfig/editorconfig ~/.editorconfig
fi

# default python packages (asdf-python)
if [ ! -e ~/.default-python-packages ]; then
  ln -s ~/.config/asdf/default-python-packages ~/.default-python-packages
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

# update asdf to latest stable release
asdf update

# install tools
if [ -d ~/.asdf ]; then
  for plugin in "${asdf_plugins[@]}"; do
    echo "#### (asdf) installing plugin $plugin ..."
    asdf plugin-add $plugin
    if [ $plugin = "nodejs" ]; then
      # Import the Node.js release team's OpenPGP keys
      bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
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
cd ~/.config/nvim/py3nvim
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
pipenv --rm
pipenv install

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

echo "##### (go) install default packages..."
for pkg in "${golang_default_packages[@]}"; do
  go get $pkg
done

setup_neovim_clipboard_config

# reshim again for enabling installed tools
asdf reshim

echo
echo "######################################################"
echo " Finished setup"
echo
echo " Make sure to add following line into your ~/.bashrc"
echo " source ~/.config/rc.sh"
echo "######################################################"
