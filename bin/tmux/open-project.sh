#!/usr/bin/env bash

$HOME/find_projects.sh | \
  fzf --header "Open project" | \
  awk '{print $2 " " $1}' | \
  xargs -r open-code-layout.sh
