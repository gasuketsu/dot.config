set -g theme_display_hg yes
set -g theme_color_scheme base16
set -g theme_date_format "+%Y-%m-%dT%T%:z"

if status --is-interactive
  if test -d $HOME/.pyenv/bin
    set -x PYENV_ROOT $HOME/.pyenv
    set -x PATH $HOME/.pyenv/bin $PATH
    source (pyenv init -|psub)
    source (pyenv virtualenv-init -|psub)
  end
end
