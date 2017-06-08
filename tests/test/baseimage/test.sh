#!/bin/sh

#
# Variables
#
SCRIPT=$(readlink -f "$0")
DIR="$(dirname $SCRIPT)"
DIR_TESTS="$(dirname $(dirname $DIR))"

DIR_LIBRARY="${DIR_TESTS}/lib"
DIR_RESOURCES="${DIR_TESTS}/resources"
DIR_TARGET="${DIR_TESTS}/target"

#
# Tests
#
. $DIR_LIBRARY/testbase.sh

# 
# Test Runner
#
(
    rm -rf $DIR_TARGET
    mkdir -p $DIR_TARGET
    (
      RESULT=$(version)
      assertEquals "version can successfully" 0 $?
    )

    (
      RESULT=$(install)
      assertNotEquals "cannot install to image" 0 $?
    )

    (
      RESULT=$(single_pdf)
      assertEquals "converting a simple pdf with one page" 0 $?
    )

    (
      RESULT=$(multi_pdf)
      assertEquals "converting a simple pdf with multiple pages" 0 $?
    )

    (
      RESULT=$(graphics_pdf)
      assertEquals "converting a simple pdf with graphics" 0 $?
    )
)