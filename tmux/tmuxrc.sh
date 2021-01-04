#!/usr/bin/env bash

function set_wsl_key_bindings () {
  if type win32yank.exe > /dev/null; then
    tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "cat | win32yank.exe -i"
    tmux bind-key \] run "win32yank.exe -o | tmux load-buffer - ; tmux paste-buffer"
  else
    tmux bind-key -T copy-mode-vi y send -X copy-selection
  fi
}

function set_linux_key_bindings () {
  if type xclip > /dev/null; then
    tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -i -sel clip > /dev/null"
    tmux bind-key \] run "xclip -o -sel clip | tmux load-buffer - ; tmux paste-buffer"
  else
    tmux bind-key -T copy-mode-vi y send -X copy-selection
  fi
}

function set_macos_key_bindings () {
  tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
}

function set_default_key_bindings () {
  tmux bind-key -T copy-mode-vi y send -X copy-selection
}


case "$(uname)" in
  "Linux")
    if [ "$(uname -r | grep -i "microsoft")" != "" ]; then
      set_wsl_key_bindings
    else
      set_linux_key_bindings
    fi
    ;;
  "Darwin")
    set_macos_key_bindings
    ;;
  *)
    set_default_key_bindings
esac
