# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/code"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "Code"

# Split window into panes.
split_h 50
select_pane 1
split_v 50
select_pane 0