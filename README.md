# dot.config
Manages configurations stored under your `~/.config`.

## Prerequisites

* Prerequisites for building Python
```
# install default GCC toolchain
sudo apt install  build-essential

# install required libraries for building Python
sudo apt install zlib1g-dev libffi-dev

# install optional (but mostly required) libraries for building Python
sudo apt install libssl-dev

# install additional optional libraries
sudo apt install libbz2-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev

# Optionally, install tk-dev if you also want to have GUI support
sudo apt install tk-dev
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

```
:CocInstall coc-json
:CocInstall coc-python
:CocInstall coc-git
:CocInstall coc-prettier
```

