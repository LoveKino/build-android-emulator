#!/bin/bash

CUR_DIR=$(cd `dirname $0`;pwd)

cd $CUR_DIR

if [ $(uname) == "Darwin" ]
    ./mac_env.sh
then 
else 
    ./ubuntu_env.sh
fi
