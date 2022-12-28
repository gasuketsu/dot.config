# dot.config

Manages configurations stored under `~/.config`.

## Prerequisites

### Debian/Ubuntu

```
sudo apt install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev liblzma-dev tk-dev xclip curl zip unzip
```

Following is optional for tmux build

```
sudo apt install automake pkg-config bison ncurses-term
```

### openSUSE

```
sudo zypper install -t pattern devel_basis
sudo zypper install dirmngr gcc-c++ xz bzip2 libbz2-devel libopenssl-devel readline-devel libffi-devel sqlite3-devel xz-devel tk-devel xclip curl zip unzip
```

Following is optional for tmux build

```
sudo zypper install terminfo pkg-config bison
```

## Installation and setup

### Initial setup

Run `setup.sh` after cloning this respository into `~/.config` as below:

```
git clone https://github.com/gasuketsu/dot.config ~/.config
~/.config/setup.sh
```

To enable configuration in bash, make sure to source `~/.config/bash/config.bash`
in your `.profile` or `.bashrc` after running setup script.

In WSL environment, you also need to set `DISPLAY` for sharing clipboard
between Windows host and WSL with X server such as [VcXsrv](https://sourceforge.net/projects/vcxsrv/).
If you use WSLg, `DISPLAY` should be set automatically so you don't need to set `DISPLAY` explicitly.

```
# WSL
export DISPLAY=localhost:0.0

# WSL2 with X server (e.g. VcXsrv)
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
```

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
