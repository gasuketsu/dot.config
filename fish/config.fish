set -g theme_display_hg yes
set -g theme_color_scheme base16

if test -d $HOME/.pyenv
    set -gx PYENV_ROOT $HOME/.pyenv
    status --is-interactive; and source (pyenv init -|psub)
end
