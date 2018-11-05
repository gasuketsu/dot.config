set -g theme_display_hg yes
set -g theme_color_scheme base16
set -g theme_date_format "+%Y-%m-%dT%T%:z"

# pyenv
if test -d $HOME/.pyenv/bin
  status --is-login; and set -gx PYENV_ROOT $HOME/.pyenv
  status --is-login; and set -gx PATH $PYENV_ROOT/bin $PATH
  status --is-interactive; and source (pyenv init -|psub)
  status --is-interactive; and source (pyenv virtualenv-init -|psub)
end
