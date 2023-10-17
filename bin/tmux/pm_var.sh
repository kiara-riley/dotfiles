# This script requires a non-managed file to set these. This is to reduce leakage
source ~/.pm_vars

if [[ -z "$pm_main_repo_root" ]];
then
  die "pm_main_repo_root not set"
fi

if [[ -z "$pm_main_branch" ]];
then
  die "pm_main_branch not set"
fi

if [[ -z "$pm_repo_test_file" ]];
then
  die "pm_repo_test_file not set"
fi

if [[ -z "$pm_remote" ]];
then
  die "pm_remote not set"
fi

if [[ $(type -t find_main_repo) != function ]];
then
  die "find_main_repo does not exist"
fi
