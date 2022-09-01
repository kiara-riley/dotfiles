# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root $PROJ

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "$PROJ"

# Split window into panes.
run_cmd "vim"
split_h 50
select_pane 2
split_v 50
select_pane 1