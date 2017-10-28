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

version () {
    echo ".f 0.0.1"
}

is_subcommand () {
    valid_subcommands=( init add )

    if [ $# -eq 0 ]; then
        return 2
    fi

    case "${valid_subcommands[@]}" in  *"$1"*) return 0 ;; esac
    return 2
}

export GITDOTF_DIR=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")

SUBCOMMAND="$1"; shift
a=`is_subcommand $SUBCOMMAND`

if is_subcommand $SUBCOMMAND ; then
    . "$GITDOTF_DIR/git-.f-$SUBCOMMAND" $@
else
    option=$SUBCOMMAND

    case "$option" in
        "-v" | "--version" )
            version
             exit 0
             ;;
        * )
            usage
            exit 2;
            ;;
    esac

fi
