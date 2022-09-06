#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  list-windows.sh | \
    # Remove the first line, the current window
    tail -n +2 | \
    fzf --header "Move to Window" --with-nth=2 | \
    awk '{print $1}' | \
    xargs -r tmux select-window -t
else
  list-windows.sh | grep "$1" | awk '{print $1}' | xargs -r tmux select-window -t
fi

