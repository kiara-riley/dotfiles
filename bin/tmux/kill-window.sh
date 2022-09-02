#!/usr/bin/env sh

list-windows.sh | awk -F" |/" '{print $1, $NF}' | fzf --no-sort -m --bind 'ctrl-a:select-all' --with-nth=2 | awk '{print $1}' | xargs -L 1 -r tmux kill-window -t
