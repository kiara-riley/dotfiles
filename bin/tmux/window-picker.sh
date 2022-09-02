#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  list-windows.sh | awk -F" |/" '{print $1, $NF}' | fzf --with-nth=2 | awk '{print $1}' | xargs -r tmux select-window -t
else
  list-windows.sh | grep "$1" | awk '{print $1}' | xargs -r tmux select-window -t
fi

