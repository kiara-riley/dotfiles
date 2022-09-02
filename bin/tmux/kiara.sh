#!/usr/bin/env bash

mkdir -p $HOME/scratch
PROJ=$(realpath $HOME/scratch)
tmuxifier load-session kiara
