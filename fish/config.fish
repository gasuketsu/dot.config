# color
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment yellow
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote green
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline
set -g fish_color_status red

set -g pure_color_current_directory brcyan
set -g pure_color_prompt_on_success brgreen
set -g pure_color_prompt_on_error brred
set -g pure_color_git_branch brmagenta
set -g pure_color_git_dirty brred
set -g pure_color_ssh_hostname brgreen
set -g pure_color_ssh_separator brgreen
set -g pure_color_ssh_user_normal brgreen
set -g pure_color_virtualenv bryellow

if status --is-interactive
    type nvim >/dev/null 2>&1
    and set -gx EDITOR nvim
    type fish >/dev/null 2>&1
    and set -gx PIPENV_SHELL (which fish)
    set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

    test -d $HOME/.local/bin
    and set -gxp PATH $HOME/.local/bin
    # fzf
    test -d $HOME/.fzf/bin
    and set -gxp PATH $HOME/.fzf/bin
    # asdf
    test -f $HOME/.asdf/asdf.fish
    and source $HOME/.asdf/asdf.fish
end

test -f $HOME/.config/fish/post_config.fish
and source $HOME/.config/fish/post_config.fish
