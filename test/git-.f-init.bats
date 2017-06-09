#!/usr/bin/env bats

load test_helper

fixtures

@test "it makes the folder a git repository" {
	cd $GIT_REPO_FIXTURE_PATH
	[ ! -d .git ]
    run $PROJECT_SOURCE/git-.f-init
	[ -d .git ]
}


@test "it adds a .f .gitignore file to the repository" {
	cd $GIT_REPO_FIXTURE_PATH
    run $PROJECT_SOURCE/git-.f-init
    run cat .gitignore
    [ $output = "*" ]
    run git ls-files .gitignore --error-unmatch
    [ $status -eq 0 ]
    run git diff --cached --exit-code --quiet .gitignore
    [ $status -eq 0 ]
}
