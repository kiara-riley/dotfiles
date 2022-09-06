#!/usr/bin/env sh

# Grab session's windows, sort so that:
# Top window is active window(for kill)
# Second window is last window(for window picker)
tmux list-windows -F "#{window_active} #{window_last_flag} #I #W #{pane_current_path}" | \
    sort -k 1,2r -k5,5 | \
    cut -d' ' -f 3-
