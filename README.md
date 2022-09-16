# dot.config

Manages configurations stored under your `~/.config`.

## Prerequisites

- Prerequisites

```
### Debian/Ubuntu
# Python build
apt install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev xclip curl
apt install tk-dev    (if you also want to have GUI support)
# tmux
apt install automake pkg-config bison ncurses-term

### openSUSE
# Python build
zypper install -t pattern devel_basis
zypper install dirmngr gcc-c++ xz bzip2 libbz2-devel libopenssl-devel readline-devel libffi-devel sqlite3-devel xclip curl
zypper install tk-devel    (if you also want to have GUI support)
# tmux
zypper install terminfo pkg-config bison

### Fedora
# Python build
dnf install dirmnger make gcc gcc-c++ xz zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel libffi-devel xclip curl
dnf install tk-devel    (if you also want to have GUI support)
# tmux
dnf install pkgconfig bison automake ncurses-term
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

In WSL/WSL2 environment, you may also need to set `DISPLAY` for sharing clipboard.
(Assuming X server such as [VcXsrv](https://sourceforge.net/projects/vcxsrv/) is
installed and running in Windows environment.)

```
# WSL
export DISPLAY=localhost:0.0

# WSL2
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
```

### Neovim plugins

Install plugins by running `PackerSync` command in your vim/neovim.

```
:PackerSync
```
