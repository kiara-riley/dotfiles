#!/usr/bin/env bash

# find_projects script output should output 1 project per line with format:
# projectname projectpath
pm_find_projects.sh | \
  fzf --header "Open project" | \
  awk '{print $2 " " $1}' | \
  xargs -r open-code-layout.sh
