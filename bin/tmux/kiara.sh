#!/usr/bin/env bash

mkdir -p $HOME/scratch
export PROJ=$(realpath $HOME/scratch)
tmuxifier load-session kiara
