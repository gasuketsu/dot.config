set -g theme_display_hg yes
set -g theme_color_scheme terminal
set -g theme_date_format "+%Y-%m-%dT%T%:z"

if status --is-interactive
  type nvim > /dev/null 2>&1; and set -gx EDITOR nvim
  type fish > /dev/null 2>&1; and set -gx PIPENV_SHELL (which fish)
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
  set -gx PIPENV_VENV_IN_PROJECT 1
end

# yarn
if test -d $HOME/.yarn/bin
  set -x PATH $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin $PATH
end

# asdf
if test -f $HOME/.asdf/asdf.fish
  status --is-interactive; and source $HOME/.asdf/asdf.fish
end
