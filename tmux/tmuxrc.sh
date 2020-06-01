#!/usr/bin/env bash

if [ "$(uname)" == "Linux" ]; then
    if [ $(uname -r | grep -i "microsoft") != "" ]; then
        # WSL
        if type win32yank.exe > /dev/null; then
            tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "cat | win32yank.exe -i"
        else
            tmux bind-key -T copy-mode-vi y send -X copy-selection
        fi
    else
        # Native Linux
        if type lemonade > /dev/null; then
            tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "lemonade copy"
        else
            tmux bind-key -T copy-mode-vi y send -X copy-selection
        fi
    fi
elif [ "$(uname)" == "Darwin" ]; then
    tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
fi
