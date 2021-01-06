#!/usr/bin/env bash

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
    set_linux_key_bindings
    ;;
  "Darwin")
    set_macos_key_bindings
    ;;
  *)
    set_default_key_bindings
esac
