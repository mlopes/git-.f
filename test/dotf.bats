#!/usr/bin/env bats

@test "it prints the .f usage help" {
    run src/git-.f
    [ $(expr "${lines[0]}" : "Usage: git .f <subcommand>") -ne 0 ]
}
