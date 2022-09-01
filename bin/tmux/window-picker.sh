#!/usr/bin/env sh

tmux list-window -a | fzf | cut -d ':' -f2 | xargs -r tmux select-window -t
