#!/usr/bin/env bash

set -Eeuo pipefail
IFS=$'\n\t'

# Set vars up
set -e
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
  branch="$1"
  worktree="$2"
  cd "$pm_main_repo_root"
  swallow_output=$(git worktree add "$worktree" "$branch")
}

origin_branches() {
  cd "$pm_main_repo_root"
  git ls-remote --heads "$pm_remote" | cut -f2 | sed -e "s/^refs\/heads\///" | awk -v remote="$pm_remote" '{ print $1 " " remote }'
}

delete_branch() {
  cd "$pm_main_repo_root"
  git worktree remove $1
}

branch_on_fs() {
  test -e "$pm_main_repo_root/$1"
}


### Commands

make() {
  local s
  s=$( select_branch )
  r=$?
  echo $r
  [ $r ] || {
    echo "Making Branch"
    read -p "Branch Name:" branch
    read -p "$branch Worktree Name:" worktree
    checkout_branch "-b$branch" $worktree
  }
}

list() {
  find_branches
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

if [[ -z "${1-}" ]];
then
  command=$(
    printf '%s\n' \
      list \
      make \
      delete \
    | fzf --header "Branch commands"
  )
else
  command="$1"
fi

case "$command" in
  make|list|delete|select_branch)
    eval $command
  ;;
  *)
    echo "$command not valid command"
    exit 1
  ;;
esac
