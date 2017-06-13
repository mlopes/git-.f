
#!/usr/bin/env bats

load test_helper

fixtures

@test "it adds a new file to the repository" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init
    run git config core.editor "sed -i -e \"1i\\Commit message\""

    echo "new file" > newfile
    run git .f add
    [ $status -eq 0 ]
    echo $output
    run git ls-files newfile --error-unmatch
    [ $status -eq 0 ]
}

@test "it add a specific file to the repository" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init
    run git config core.editor "sed -i -e \"1i\\Commit message\""

    export EDITOR=$ORIGINAL_EDITOR
    echo "new file" > newfile
    echo "another file" > anotherfile
    run git .f add newfile
    [ $status -eq 0 ]
    run git ls-files newfile --error-unmatch
    [ $status -eq 0 ]
    run git ls-files anotherfile --error-unmatch
    [ $status -ne 0 ]
}


@test "it commits the added files" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init
    run git config core.editor "sed -i -e \"1i\\Commit message\""

    echo "new file" > newfile
    run git .f add newfile
    [ $status -eq 0 ]
    run git ls-files newfile --error-unmatch
    [ $status -eq 0 ]
    run git diff --cached --exit-code --quiet newfile
    [ $status -eq 0 ]
 }
