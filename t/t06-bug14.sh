#! /usr/bin/env bash

set -e

# Each test script should include testlib.sh
source testlib.sh
# When the test is ready, set this to false for nice outputs.
# if you want to see what happens, use those flags
# verbose="true"
# warnings="true"

# The conffile part of the test, see confs/* for details.
source confs/base.conf
source confs/tarball.conf

export BM_ARCHIVE_ROOT="repository"
export BM_ARCHIVE_METHOD="tarball-incremental pipe"
export BM_TARBALL_DIRECTORIES="$PWD"

export BM_TARBALLINC_MASTERDATETYPE="weekly"
export BM_TARBALLINC_MASTERDATEVALUE="1"

source ../lib/sanitize.sh

# The test actions
if [[ -e $BM_ARCHIVE_ROOT ]]; then
    rm -f $BM_ARCHIVE_ROOT/*
fi    

bm_init_env
bm_init_today
create_directories
make_archives

name=$(get_dir_name $PWD long)
if [[ -e "$BM_ARCHIVE_ROOT/$BM_ARCHIVE_PREFIX$name.$TODAY.master.tar.gz" ]]; then
    rm -rf $PWD/repository
    exit 0
else
    rm -rf $PWD/repository
    exit 1
fi        
