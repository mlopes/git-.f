setup () {
    export ORIGINAL_PATH=$PATH
    project_root="$(pwd)/src"
    export PATH=$PATH:$project_root
}

teardown () {
    export PATH=$ORIGINAL_PATH
}
