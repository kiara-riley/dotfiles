#!/usr/bin/env bash

set -euo pipefail

SEARCH="$HOME"

do_thing() {
  res=$(find $SEARCH -maxdepth 2 -type d | xargs realpath | fzf --expect=ctrl-t,ctrl-n --header "Find a dir, ctrl-t or ctrl-n to finalize with selection")

  readarray -t lines <<< "${res}"

  button="${lines[0]}"
  path="${lines[1]}"
  SEARCH="$path"

  if [[ -z $button ]];
  then
    do_thing
  fi

  return 0
}

do_thing

echo "Opening $SEARCH"
read -p "Name? " name
open-code-layout.sh "$SEARCH" "$name"
