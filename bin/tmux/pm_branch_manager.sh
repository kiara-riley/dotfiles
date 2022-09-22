#!/usr/bin/env bash

set -Eeuo pipefail
IFS=$'\n\t'

# Set vars up
source pm_var.sh

find_branches() {
  for branch in $(find "$pm_main_repo_root" -mindepth 1 -maxdepth 6 -name "$pm_repo_test_file" -type f | xargs realpath)
  do
    branch=${branch%"/$pm_repo_test_file"}
    branch_name=${branch#"$pm_main_repo_root/"}
    echo "$branch_name $branch $(git -C "$branch" rev-parse --abbrev-ref HEAD)"
  done
}

checkout_branch() {
  base_branch="$1"
  worktree="$2"
  swallow_output=$(git -C "$pm_main_repo_root" worktree add "$worktree" "$base_branch" ${@:3:15})
}

origin_branches() {
  git -C "$pm_main_repo_root" ls-remote --heads "$pm_remote" | \
  cut -f2 | \
  sed -e "s/^refs\/heads\///" | \
  awk -v remote="$pm_remote" '{ print $1 " " remote }'
}

delete_branch() {
  git -C "$pm_main_repo_root" worktree remove $1
}

branch_on_fs() {
  test -e "$pm_main_repo_root/$1"
}


### Commands

make() {
  echo "Making Branch"
  read -p "New Branch Name:" branch
  read -p "$branch Worktree Name:" worktree
  base_branch=$(origin_branches | fzf --header "Select Base Branch" | awk '{ print $2 "/" $1 }')
  checkout_branch $base_branch $worktree -b$branch --no-track
}

list() {
  find_branches | fzf --header "List of branches, no action taken"
}

delete() {
  delete_branch $(find_branches | fzf --header "Which branch to delete?" | cut -d' ' -f2)
}

select_branch() {
  BRANCH=$({ find_branches; origin_branches ||:; } | fzf --header "Select Branch" | cut -d' ' -f1)
  if ! branch_on_fs $BRANCH
  then
    read -p "$BRANCH Worktree Name:" worktree
    checkout_branch $BRANCH $worktree
    echo "$worktree"
  else
    echo "$BRANCH"
  fi
}

open_branch_project() {
  BRANCH=$(find_branches | fzf --header "Select Branch" | cut -d' ' -f1)
  open-project.sh "$BRANCH"
}

update_remote() {
  git -C "$pm_main_repo_root" fetch
}

if [[ -z "${1-}" ]];
then
  command=$(
    printf '%s\n' \
      open_branch_project \
      make \
      delete \
      update_remote \
      list \
    | fzf --header "Branch commands"
  )
else
  command="$1"
fi

case "$command" in
  make|list|delete|select_branch|open_branch_project|update_remote)
    eval $command
  ;;
  *)
    echo "$command not valid command"
    exit 1
  ;;
esac
