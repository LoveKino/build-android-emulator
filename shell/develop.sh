#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

cd $CUR_DIR

# patch modified code
./patch.sh

# build android os
./buildSource.sh

# start emulator
./startEmulator.sh
