# dot.config
Manages configurations stored under your `~/.config`.
Clone this respository into `~/.config` as below:

```
$ git clone https://github.com/gasuketsu/dot.config ~/.config
```

## Instalation and setup

* Run setup script `setup.sh` to setup [asdf](https://github.com/asdf-vm/asdf), [tpm](https://github.com/tmux-plugins/tpm), [fisherman](https://github.com/jorgebucaran/fisher) and initial configurations.

```
$ ~/.config/setup.sh
```

* Install nodejs

```
# For asdf users
$ asdf plugin-add nodejs
$ bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
$ asdf install nodejs <version>
$ asdf global nodejs <version>
$ asdf reshim
```

* Install yarn

```
$ curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```

