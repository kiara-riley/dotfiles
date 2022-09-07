#!/usr/bin/env bash

mkdir -p $HOME/scratch
export PROJ=$(realpath $HOME/scratch)
export PROJ_NAME="scratch"
tmuxifier load-session kiara
