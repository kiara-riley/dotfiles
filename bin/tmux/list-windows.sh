#!/usr/bin/env sh

tmux list-windows -a -F "#{window_active} #I #W" | sort -n -r | awk '{print $2 " " $3}'
