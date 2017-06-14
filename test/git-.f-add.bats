
#!/usr/bin/env bats

load test_helper

fixtures

@test "it adds a new file to the repository" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init

    echo "new file" > newfile
    run git .f add
    assert_success

    run git ls-files newfile --error-unmatch
    assert_success
}

@test "it add a specific file to the repository" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init

    echo "new file" > newfile
    echo "another file" > anotherfile
    run git .f add newfile
    assert_success
    run git ls-files newfile --error-unmatch
    assert_success
    run git ls-files anotherfile --error-unmatch
    assert_failure 1
}


@test "it commits the added files" {
	cd $GIT_REPO_FIXTURE_PATH
    run git .f init

    echo "new file" > newfile
    run git .f add newfile
    assert_success
    run git ls-files newfile --error-unmatch
    assert_success
    run git diff --cached --exit-code --quiet newfile
    assert_success
 }
