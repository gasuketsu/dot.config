set -gx PIPENV_VENV_IN_PROJECT 1
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx FZF_DEFAULT_OPTS_FILE ~/.config/fzf/config
set -gx FZF_CTRL_T_OPTS "--walker-skip .git,.hg,.venv,node_modules
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"

# environment variables
if test -f ~/.environment
    export (envsubst <~/.environment)
end
