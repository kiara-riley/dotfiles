#!/bin/sh
xrandr --output eDP-1 --off --output DP-2 --primary --mode 3840x1600 --pos 0x0 --rotate normal
xrandr --auto
xrandr --output eDP-1 --off --output DP-2 --primary --mode 3840x1600 --pos 0x0 --rotate normal
xset -dpms
xset s 3600 3600
