set -g theme_display_hg yes
set -g theme_color_scheme base16
set -g theme_date_format "+%Y-%m-%dT%T%:z"

if status --is-login
  if test -d $HOME/.pyenv
    set -x PYENV_ROOT $HOME/.pyenv
    source (pyenv init -|psub)
    source (pyenv virtualenv-init -|psub)
  end
end
