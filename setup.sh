#! /usr/bin/env bash

CWD=$PWD

mkdir -p "$HOME/.local/bin"

# Fisher
if type fish > /dev/null 2>&1 && ! fish -c "type fisher" > /dev/null 2>&1; then
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

# rtx
if ! type rtx > /dev/null 2>&1; then
  curl https://rtx.pub/install.sh | sh
fi

if [ ! -e "$HOME/.local/bin/rtx" ]; then
  ln -s "$HOME/.local/share/rtx/bin/rtx" "$HOME/.local/bin/rtx"
fi

# default python packages
if [ ! -e "$HOME/.default-python-packages" ]; then
  cp "$HOME/.config/rtx/default-python-packages" "$HOME/.default-python-packages"
fi
# default golang packages
if [ ! -e "$HOME/.default-go-packages" ]; then
  cp "$HOME/.config/rtx/default-go-packages" "$HOME/.default-go-packages"
fi
# default npm packages
if [ ! -e "$HOME/.default-npm-packages" ]; then
  cp "$HOME/.config/rtx/default-npm-packages" "$HOME/.default-npm-packages"
fi
# default go env (only when no env file exist)
if [ ! -f "$HOME/.config/go/env" ]; then
  mkdir -p "$HOME/.config/go"
  echo "GOBIN=$HOME/.local/bin" > "$HOME/.config/go/env"
fi

source "$HOME/.config/bash/rc.bash"
# install tools
rtx install
# generate completions
rtx completion fish > ~/.config/fish/completions/rtx.fish

# (python) install pipx packages
echo "##### (python) (re)install pipx packages..."
export PATH="$HOME/.local/bin:$PATH"
while read -r pkg; do
  rtx exec python --command "pipx install --force $pkg"
done < "$HOME/.config/pipx/pipx_packages"

# (python) venv for nvim python bindings
echo "##### (python) reinitialize virtualenv for neovim python bindings..."
cd "$HOME/.config/nvim/py3nvim"
rtx exec python --command "pipenv --rm"
rtx exec python --command "pipenv install"
cd $CWD

echo
echo "######################################################"
echo " Finished setup"
echo
echo " To enable configuration in bash, make sure to add"
echo " following line into your ~/.profile or ~/.bashrc"
echo " source ~/.config/bash/rc.bash"
echo "######################################################"
