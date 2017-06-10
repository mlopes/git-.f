#!/usr/bin/env bats

load test_helper

fixtures

@test "it makes the folder a git repository" {
	cd $GIT_REPO_FIXTURE_PATH
	[ ! -d .git ]
    run git .f init
	[ -d .git ]
}


@test "it adds a .f .gitignore file to the repository" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init
    run cat .gitignore
    [ $output = "*" ]
    run git ls-files .gitignore --error-unmatch
    [ $status -eq 0 ]
    run git diff --cached --exit-code --quiet .gitignore
    [ $status -eq 0 ]
}

@test "it print .f init usage help when called with -h" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init -h
    [ $output = "usage: git .f init [-h]" ]
}
