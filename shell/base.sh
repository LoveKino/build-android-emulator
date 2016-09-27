#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)
ANDROID_SPACE=/Volumes/untitled/
AOSP_DIR=${ANDROID_SPACE}/WORKING_DIRECTORY
GOLD_FISH_DIR=${ANDROID_SPACE}/goldfish
# android-5.1.1_r26 for Lollipop Nexus6
# https://source.android.com/source/build-numbers.html#source-code-tags-and-builds
ANDROID_BRANCH=master
#ANDROID_BRANCH=android-5.1.1_r26

if [ $(uname) == "Darwin" ]
then 
    export OUT_DIR_COMMON_BASE=$AOSP_DIR/mac_out/$ANDROID_BRANCH
    export CCACHE_DIR=${ANDROID_SPACE}/cache/mac/$ANDROID_BRANCH/.ccache
else 
    export OUT_DIR_COMMON_BASE=$AOSP_DIR/mac_linux/$ANDROID_BRANCH
    export CCACHE_DIR=${ANDROID_SPACE}/cache/linux/$ANDROID_BRANCH/.ccache
fi

mkdir -p $CCACHE_DIR

if [ $(uname) == "darwin" ] 
then
    export PATH=/opt/local/bin:$PATH
    ulimit -S -n 1024
fi

PATH=~/bin:$PATH

cd $AOSP_DIR
repo init -b ${ANDROID_BRANCH}
