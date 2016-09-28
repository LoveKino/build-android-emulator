#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)
ANDROID_SPACE=/Volumes/untitled
AOSP_DIR=${ANDROID_SPACE}/WORKING_DIRECTORY
GOLD_FISH_DIR=${ANDROID_SPACE}/goldfish
# android-5.1.1_r26 for Lollipop Nexus6
# https://source.android.com/source/build-numbers.html#source-code-tags-and-builds
#ANDROID_BRANCH=master
ANDROID_BRANCH=android-5.1.1_r26
#ANDROID_BRANCH=android-7.0.0_r6

if [ $(uname) == "Darwin" ]
then 
    export OUT_DIR_COMMON_BASE=$AOSP_DIR/mac_out/$ANDROID_BRANCH
    export CCACHE_DIR=${ANDROID_SPACE}/cache/mac/$ANDROID_BRANCH/.ccache
else 
    export OUT_DIR_COMMON_BASE=$AOSP_DIR/mac_linux/$ANDROID_BRANCH
    export CCACHE_DIR=${ANDROID_SPACE}/cache/linux/$ANDROID_BRANCH/.ccache
fi

#alias jack-admin=$AOSP_DIR/prebuilts/sdk/tools/jack-admin

mkdir -p $CCACHE_DIR

if [ $(uname) == "darwin" ] 
then
    export PATH=/opt/local/bin:$PATH
    ulimit -S -n 1024
fi

[ ! -d ~/bin ] && mkdir ~/bin

# repo tool
if [ ! -f ~/bin/repo ]
then
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
fi

PATH=~/bin:$PATH

cd $AOSP_DIR
repo init -b ${ANDROID_BRANCH}
# TODO aync
#repo sync
