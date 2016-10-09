#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

# clean base part code
cd $AOSP_DIR/frameworks/base
git reset --hard

cd $CUR_DIR

# patch modified code
../node_modules/.bin/build-android-patch $AOSP_DIR $ANDROID_BRANCH
