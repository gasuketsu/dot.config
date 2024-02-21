# dot.config

Manages configurations stored under `~/.config`.

## Prerequisites

### Debian/Ubuntu

```
sudo apt install git fish build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev liblzma-dev tk-dev wl-clipboard curl zip unzip ncurses-term
```

### openSUSE

```
sudo zypper install -t pattern devel_basis
sudo zypper install git fish dirmngr gcc-c++ xz bzip2 libbz2-devel libopenssl-devel readline-devel libffi-devel sqlite3-devel xz-devel tk-devel wl-clipboard curl zip unzip terminfo
```

## Installation and setup

### Initial setup

Run `setup.sh` after cloning this respository into `~/.config` as below:

```
git clone https://github.com/gasuketsu/dot.config ~/.config
~/.config/setup.sh
```

To enable configuration in bash, make sure to source `~/.config/bash/rc.bash`
in your `.profile` or `.bashrc` after running setup script.

In WSL environment, make sure to enable WSLg (i.e. `guiApplication = true` in .wslconfig)
for sharing clipboard between Windows host and WSL.

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
