
#!/usr/bin/env bats

load test_helper

fixtures

@test "it adds a new file to the repository" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init
    echo "new file" > newfile
    run git .f add
    [ $status -eq 0 ]
    echo $output
    run git ls-files newfile --error-unmatch
    [ $status -eq 0 ]
}
