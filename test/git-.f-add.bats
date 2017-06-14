
#!/usr/bin/env bats

load test_helper

fixtures

@test "it adds a new file to the repository" {
    run git .f init

    echo "new file" > newfile
    run git .f add
    assert_success

    run git ls-files newfile --error-unmatch
    assert_success
}

@test "it adds a specific file to the repository" {
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
    run git .f init

    echo "new file" > newfile
    run git .f add newfile
    assert_success
    run git ls-files newfile --error-unmatch
    assert_success
    run git diff --cached --exit-code --quiet newfile
    assert_success
 }
