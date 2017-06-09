#!/usr/bin/env bats

load test_helper

fixtures

@test "it makes the folder a git repo" {
	cd $GIT_REPO_FIXTURE_PATH
	run git rev-parse --git-dir > /dev/null 2>&1
	[ ! -d .git ]
    run $PROJECT_SOURCE/git-.f-init
	[ -d .git ]
	
	rm -fr $GIT_REPO_FIXTURE_PATH/.git
}
