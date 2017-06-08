#!/usr/bin/env bash

usage () {
    echo "Usage: git .f <subcommand>"
    echo
    echo "    git .f - Will show a help screen"
    echo "    git .f init - Sets up a folder as a new git .f repository"
    echo "    git .f add - Adds changes to the current host's branch"
    echo "    git .f apply - Applies an existing git .f repository to an existing folder"
    echo "    git .f baseadd - Adds changes to to the base branch and rebases the host branch"
}

usage
