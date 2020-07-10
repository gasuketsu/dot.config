# dot.config
Manages configurations stored under your `~/.config`.

## Prerequisites

* Prerequisites
```
### Debian/Ubuntu
# Python build
apt install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev
apt install tk-dev    (if you also want to have GUI support)
# tmux
apt install ncurses-term

### openSUSE
# Python build
zypper install gcc automake xz bzip2 libbz2-devel openssl-devel ncurses-devel readline-devel zlib-devel libffi-devel sqlite3-devel
zypper install tk-devel    (if you also want to have GUI support)
# tmux
zypper install ncurses-term

### CentOS/Fedora 21 and below
# Python build
yum install gcc xz zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel libffi-devel
yum install tk-devel    (if you also want to have GUI support)
# tmux
yum install ncurses-term

### Fedora 22 and above
# Python build
dnf install make gcc xz zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel libffi-devel
dnf install tk-devel    (if you also want to have GUI support)
# tmux
dnf install ncurses-term
```

## Installation and setup

### Initial setup

Run `setup.sh` after cloning this respository into `~/.config` as below:

```
$ git clone https://github.com/gasuketsu/dot.config ~/.config
$ ~/.config/setup.sh
```

Make sure to source `~/.config/rc.sh` in your `.bashrc` after running setup script.

### Language servers

Install language servers for Python and Go.

* python-language-server
```
pip install python-language-server
```

* gopls
```
go get golang.org/x/tools/gopls@latest
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

