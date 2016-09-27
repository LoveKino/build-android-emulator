#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

cd $CUR_DIR

# patch modified code
../node_modules/.bin/build-android-patch $AOSP_DIR $ANDROID_BRANCH

# build android os
./buildSource.sh

# start emulator
./startEmulator.sh
