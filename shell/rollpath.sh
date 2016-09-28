#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

cd $CUR_DIR

# patch modified code
../node_modules/.bin/build-android-patch-recovery $AOSP_DIR $ANDROID_BRANCH
