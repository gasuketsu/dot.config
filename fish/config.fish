set -g theme_display_hg yes
set -g theme_color_scheme dark
set -g theme_date_format "+%Y-%m-%dT%T%:z"

if status --is-interactive
  type nvim > /dev/null 2>&1; and set -gx EDITOR nvim
end

# asdf
if test -f $HOME/.asdf/asdf.fish
  status --is-interactive; and source $HOME/.asdf/asdf.fish
end
