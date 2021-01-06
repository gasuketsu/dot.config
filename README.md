# dot.config
Manages configurations stored under your `~/.config`.

## Prerequisites

* Prerequisites
```
### Debian/Ubuntu
# Python build
apt install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev xclip
apt install tk-dev    (if you also want to have GUI support)
# tmux
apt install automake pkg-config bison ncurses-term

### openSUSE
# Python build
zypper install -t pattern devel_basis
zypper install xz bzip2 libbz2-devel libopenssl-devel readline-devel libffi-devel sqlite3-devel xclip
zypper install tk-devel    (if you also want to have GUI support)
# tmux
zypper install terminfo pkg-config bison

### CentOS/Fedora 21 and below
# Python build
yum install gcc xz zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel libffi-devel xclip
yum install tk-devel    (if you also want to have GUI support)
# tmux
yum install pkgconfig bison automake ncurses-term

### Fedora 22 and above
# Python build
dnf install make gcc xz zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel libffi-devel xclip
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

### Vim/Neovim plugins

Install plugins by running ``PlugInstall`` command in your vim/neovim.

```
:PlugInstall
```

### coc.nvim extentions

Install following extentions by running ``CocInstall`` command in your neovim.

* [coc-json](https://github.com/neoclide/coc-json)
* [coc-python](https://github.com/neoclide/coc-python)
* [coc-git](https://github.com/neoclide/coc-git)
* [coc-prettier](https://github.com/neoclide/coc-prettier)
* [coc-go](https://github.com/josa42/coc-go)

Find and install [coc.nvim extentions](https://github.com/neoclide/coc.nvim#extensions) depends on your need.

```
:CocInstall coc-json
:CocInstall coc-python
:CocInstall coc-git
:CocInstall coc-prettier
:CocInstall coc-go
```

