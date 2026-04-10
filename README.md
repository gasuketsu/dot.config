# dot.config

Manages configurations stored under `~/.config`.

## Prerequisites

### Debian/Ubuntu

```
sudo apt install git fish build-essential wl-clipboard curl zip unzip ncurses-term gettext-base
```

### openSUSE

```
sudo zypper install -t pattern devel_basis
sudo zypper install git fish dirmngr gcc-c++ wl-clipboard curl zip unzip terminfo
```

### archlinux

```
sudo pacman -S base-devel git fish zlib-ng wl-clipboard curl zip unzip
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
Also, you can sync packages managed in `nvim/lua/plugins.lua` with `Lazy` command
in neovim.

```
:Lazy sync
```
