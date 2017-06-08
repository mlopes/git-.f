#!/usr/bin/env bats

load test_helper

@test "it prints the .f usage help" {
    run git .f
    [ $(expr "${lines[0]}" : "Usage: git .f <subcommand>") -ne 0 ]
}
