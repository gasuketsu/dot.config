# dot.config

Manages configurations stored under `~/.config`.

## Prerequisites

### Debian/Ubuntu

```
sudo apt install git fish build-essential zlib2g-dev libffi-dev libssl-dev libbz2-dev \
         libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev \
         liblzma-dev tk-dev wl-clipboard curl zip unzip ncurses-term fzf gettext-base plocate
```

### openSUSE

```
sudo zypper install -t pattern devel_basis
sudo zypper install git fish dirmngr gcc-c++ xz bzip2 libbz2-devel libopenssl-devel \
         readline-devel libffi-devel sqlite3-devel xz-devel tk-devel wl-clipboard \
         curl zip unzip terminfo fzf plocate
```

### archlinux

```
sudo pacman -S base-devel git fish zlib-ng xz bzip2 readline libffi sqlite3 wl-clipboard \
         curl zip unzip fzf plocate
```

## Installation and setup

### Initial setup

Run `setup.sh` after cloning this respository into `~/.config` as below:

```
git clone https://github.com/gasuketsu/dot.config ~/.config
~/.config/setup.sh
```

To enable configuration in bash, make sure to source `~/.config/bash/config.bash`
in your `.bashrc` after running setup script.

### Neovim plugins

Packages should be installed automatically when you start neovim first time with this config.
Also, you can install/update packages managed in `nvim/lua/plugins.lua` with `Lazy` command
in neovim.

```
# install
:Lazy install

# update
:Lazy update
```
