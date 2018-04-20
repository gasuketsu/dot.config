set -g theme_display_hg yes
set -g theme_color_scheme base16

if test -d $HOME/.pyenv/bin
    set -x PATH "$HOME/.pyenv/bin" $PATH
    status --is-interactive; and . (pyenv init -|psub)
    status --is-interactive; and . (pyenv virtualenv-init -|psub)
    status --is-login; and status --is-interactive; and exec byobu-launcher
end
