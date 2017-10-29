#!/usr/bin/env bats

load test_helper

fixtures

@test "it exits with status 2 when called without parameters and yields a usage message" {
  run git .f apply
  assert_output "usage: git .f apply <name of the dotfiles repository to apply>"
  assert_failure 2
}

@test "it fails if the folder is a git repository and yields an error message" {
  git init
  run git .f apply /tmp/fakerepo
  assert_output "A .git folder was found in `pwd`. This means the folder is already a git repository, cannot apply the .f repository."
  assert_failure 3
}

@test "it applies a specified repository to the current folder" {
  assert_file_not_exist .git
  TMP_REPO=$(temp_make)
  cd $TMP_REPO
  git init
  cd $GIT_REPO_FIXTURE_PATH
  run git .f apply $TMP_REPO
  yes | rm -r -- "$TMP_REPO" 2>&1
  assert_file_exist .git
}

