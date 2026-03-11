#!/usr/bin/env bash

# find_projects script output should output 1 project per line with format:
# projectname projectpath
pm_find_projects.sh $@ | \
  fzf --header "Open project" -m --bind 'ctrl-a:select-all' | \
  awk '{print $2 " " $1}' | \
  xargs -L1 -r open-code-layout.sh
