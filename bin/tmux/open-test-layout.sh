#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "$1 doesn't exist"
  exit 1
else
  P="$1"
fi
export PROJ="$P"
export PROJ_NAME=$(realpath "$PROJ" | xargs basename)

if [[ -d $PROJ ]]; then
  tmuxifier load-window test
else
  echo "Arg must be a directory"
fi
