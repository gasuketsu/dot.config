set -g theme_display_hg yes
set -g theme_color_scheme gruvbox
set -g theme_date_format "+%Y-%m-%dT%T%:z"

# asdf
if test -f $HOME/.asdf/asdf.fish
  status --is-interactive; and source $HOME/.asdf/asdf.fish
end
