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
source confs/tarball-incremental.conf
export BM_TARBALLINC_MASTERDATEVALUE=7
source $locallib/sanitize.sh

# The test actions
bm_init_env
bm_init_today


# remove the stuff generated
rm -rf repository

exit 0
