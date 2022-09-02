#!/usr/bin/env bash

$HOME/find_projects.sh | \
  awk -F"/" '{ print $0 " " $NF}' | \
  fzf --header "Open project" --with-nth 1,3 | \
  awk '{print $2}' | \
  xargs -r open-code-layout.sh
