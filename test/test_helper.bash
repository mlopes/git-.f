load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'
load 'test_helper/bats-file/load'

fixtures () {
    GIT_REPO_FIXTURE_PATH="$BATS_TEST_DIRNAME/fakerepo"
    RELATIVE_GIT_REPO_FIXTURE_PATH="$(bats_trim_filename "$GIT_REPO_FIXTURE_PATH")"
    DOTF_PROJECT_ROOT="$(pwd)"
    PROJECT_SOURCE="$DOTF_PROJECT_ROOT/src"
}

setup () {
    export ORIGINAL_PATH=$PATH
    export PATH=$PATH:$PROJECT_SOURCE

    mkdir -p $GIT_REPO_FIXTURE_PATH
}

teardown () {
	cd $DOTF_PROJECT_ROOT
	rm -fr $RELATIVE_GIT_REPO_FIXTURE_PATH

    export PATH=$ORIGINAL_PATH
}
