#!/usr/bin/env bats

load test_helper

fixtures

@test "it makes the folder a git repository" {
  assert_file_not_exist .git
  run git .f init
  assert_file_exist .git
}


@test "it adds a .f .gitignore file to the repository" {
  run git .f init
  run cat .gitignore
  assert_output "*"
  run git ls-files .gitignore --error-unmatch
  assert_success
  run git diff --cached --exit-code --quiet .gitignore
  assert_success
}

@test "it prints .f init usage help when called with -h" {
  run git .f init -h
  assert_output "usage: git .f init [-h]"
}
