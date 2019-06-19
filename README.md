# dot.config
Manages configurations stored under your `~/.config`.

## Installation and setup

### Initial setup

Run `setup.sh` after cloning this respository into `~/.config` as below:

```
$ git clone https://github.com/gasuketsu/dot.config ~/.config
$ ~/.config/setup.sh
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

```
:CocInstall coc-json
:CocInstall coc-python
:CocInstall coc-git
```
