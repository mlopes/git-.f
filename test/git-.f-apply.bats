#!/usr/bin/env bats

load test_helper

fixtures

@test "it exits with status 2 when called without parameters" {
  run git-.f-apply
  assert_failure 2
}

@test "it fails if the folder is a git repository and yields an error message" {
  git init
  run git-.f-apply /tmp/fakerepo
  assert_output "A .git folder was found in `pwd`. This means the folder is already a git repository, cannot apply the .f repository."
  assert_failure 3
}

