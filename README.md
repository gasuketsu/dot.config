# dot.config

Manages configurations stored under `~/.config`.

## Prerequisites

```
### Debian/Ubuntu
# Python build
apt install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev liblzma-dev xclip curl zip unzip
apt install tk-dev    (if you also want to have GUI support)
# tmux build (optional)
apt install automake pkg-config bison ncurses-term

### openSUSE
# Python build
zypper install -t pattern devel_basis
zypper install dirmngr gcc-c++ xz bzip2 libbz2-devel libopenssl-devel readline-devel libffi-devel sqlite3-devel xz-devel xclip curl zip unzip
zypper install tk-devel    (if you also want to have GUI support)
# tmux build (optional)
zypper install terminfo pkg-config bison
```

## Installation and setup

### Initial setup

Run `setup.sh` after cloning this respository into `~/.config` as below:

```
$ git clone https://github.com/gasuketsu/dot.config ~/.config
$ ~/.config/setup.sh
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
