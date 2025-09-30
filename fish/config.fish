# suppress greeting message
set fish_greeting

if status --is-interactive
    mise activate fish | source
    mise exec zoxide --command "zoxide init fish" | source
    mise exec starship --command "starship init fish" | source
    atuin init fish | source
end
