# suppress greeting message
set fish_greeting

set --global fish_key_bindings fish_default_key_bindings

if status --is-interactive
    mise activate fish | source
    mise exec zoxide --command "zoxide init fish" | source
    mise exec starship --command "starship init fish" | source
end
