#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "$1 doesn't exist"
  exit 1
else
  PROJ=$(realpath "$1")
  export PROJ
fi

list-windows.sh | grep -q "$PROJ$" && { window-picker.sh "$PROJ"; exit 0; }

if [[ -d $PROJ ]]; then
  tmuxifier load-window code
else
  echo "Arg must be a directory"
fi
