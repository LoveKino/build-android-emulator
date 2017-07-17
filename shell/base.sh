#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

ANDROID_SPACE=/Volumes/android
AOSP_DIR=${ANDROID_SPACE}/WORKING_DIRECTORY
GOLD_FISH_DIR=${ANDROID_SPACE}/goldfish

# android-5.1.1_r26 for Lollipop Nexus6
# https://source.android.com/source/build-numbers.html#source-code-tags-and-builds
#ANDROID_BRANCH=master
#ANDROID_BRANCH=android-5.1.1_r26
ANDROID_BRANCH=android-7.0.0_r6

# cache
if [ $(uname) == "Darwin" ]
then 
    export OUT_DIR_COMMON_BASE=$AOSP_DIR/mac_out/$ANDROID_BRANCH
    export CCACHE_DIR=${ANDROID_SPACE}/cache/mac/$ANDROID_BRANCH/.ccache
else 
    export OUT_DIR_COMMON_BASE=$AOSP_DIR/mac_linux/$ANDROID_BRANCH
    export CCACHE_DIR=${ANDROID_SPACE}/cache/linux/$ANDROID_BRANCH/.ccache
fi
mkdir -p $CCACHE_DIR

#alias jack-admin=$AOSP_DIR/prebuilts/sdk/tools/jack-admin

if [ $(uname) == "darwin" ] 
then
    export PATH=/opt/local/bin:$PATH
    # set the number of open files to be 1024
    ulimit -S -n 1024
fi

# repo tool
[ ! -d ~/bin ] && mkdir ~/bin
if [ ! -f ~/bin/repo ]
then
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
fi
PATH=~/bin:$PATH

# check branch
cd $AOSP_DIR
repo init -b ${ANDROID_BRANCH}
# TODO aync
# repo sync
