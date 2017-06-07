#!/usr/bin/env bats

@test "it prints the .f usage help" {
    run src/git-.f
    [ "${output}" == "Usage: git .f - Will show a help screen" ]
}
