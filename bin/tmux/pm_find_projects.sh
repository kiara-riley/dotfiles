#!/usr/bin/env bash

findp() {
  find $1 -mindepth 1 -maxdepth 1 -type d | xargs realpath | awk -F" |/" -v h="$2" '{print h "-" $NF " " $0}'
}

singl() {
  echo "$2" $(realpath $1)
}

# Set vars up
set -e
source pm_var.sh


if [[ -z "$1" ]]
then
  findp $HOME/git/personal "me";
  findp $HOME/git "git";
  find_main_repo "$pm_main_branch"
  exit 0
elif test -e "$pm_main_repo_root/$1/$pm_repo_test_file"
then
  find_main_repo "$1"
  exit 0
else
  die "Branch did not exist"
fi
