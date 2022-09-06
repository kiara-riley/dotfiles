#!/usr/bin/env bash

if [[ -z "$1" || -z "$2" ]]; then
  echo "$1 or $2 args empty"
  exit 1
else
  PROJ=$(realpath "$1")
  PROJ_NAME="$2"
  export PROJ
  export PROJ_NAME
fi

# Check if new path exists in current open windows,
#  Open that window if so
list-windows.sh | grep -q "$PROJ$" && { window-picker.sh "$PROJ"; exit 0; }

if [[ -d $PROJ ]]; then
  tmuxifier load-window code
else
  echo "Arg must be a directory"
fi
