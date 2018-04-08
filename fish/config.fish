set -g theme_display_hg yes
set -g theme_color_scheme base16

set -x PATH "/home/tharada/.pyenv/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)
