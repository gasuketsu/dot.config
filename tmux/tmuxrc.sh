#!/usr/bin/env bash

function set_wsl_keybindings () {
    if type win32yank.exe > /dev/null; then
        tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "cat | win32yank.exe -i"
    else
        tmux bind-key -T copy-mode-vi y send -X copy-selection
    fi
}

function set_linux_key_bindings () {
    if type lemonade > /dev/null; then
        tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "lemonade copy"
    else
        tmux bind-key -T copy-mode-vi y send -X copy-selection
    fi
}

function set_macos_keybindings () {
    tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
}

function set_default_keybindings () {
    tmux bind-key -T copy-mode-vi y send -X copy-selection
}


case "$(uname)" in
    "Linux")
        if [ $(uname -r | grep -i "microsoft") != "" ]; then
            set_wsl_keybindings
        else
            set_linux_keybindings
        fi
        ;;
    "Darwin")
        set_macos_keybindings
        ;;
    *)
        set_default_keybindings
esac
