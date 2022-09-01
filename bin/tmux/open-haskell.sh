#!/usr/bin/env sh

ls -d  $HOME/git/end-to-end/src/haskell/*/ | fzf | xargs -r open-test-layout.sh
