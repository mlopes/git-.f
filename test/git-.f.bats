#!/usr/bin/env bats

load test_helper

fixtures

@test "it prints the .f usage help" {
    run git .f
    assert [ $(expr "${lines[0]}" : "Usage: git .f <subcommand>") -ne 0 ]
}

@test "it exits with status 2 when called without parameters" {
    run git .f
    assert_failure 2
}

@test "it prints out the version when called with -v or --version" {
    run git .f -v
    assert_equal "$output" ".f 0.0.1"

    run git .f --version
    assert_equal "$output" ".f 0.0.1"
}
