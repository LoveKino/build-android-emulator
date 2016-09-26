#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

[ ! -d ~/bin ] && mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

cd $CUR_DIR && cd ..

mkdir $AOSP_DIR
cd $AOSP_DIR

# download master
repo init -u https://android.googlesource.com/platform/manifest

repo sync
