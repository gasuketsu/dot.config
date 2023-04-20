# color
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment yellow
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape bryellow --bold
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote green
set -g fish_color_redirection brblue
set -g fish_color_search_match bryellow '--background=brblack'
set -g fish_color_selection white --bold '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline
set -g fish_color_status red

# suppress greeting message
set fish_greeting

type nvim >/dev/null 2>&1 and set -gx EDITOR nvim
set -gx PIPENV_VENV_IN_PROJECT 1
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin

if status --is-interactive
  rtx activate fish | source
  rtx exec starship --command "starship init fish" | source
end
