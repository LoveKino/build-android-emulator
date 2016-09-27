#!/bin/bash

source $(cd `dirname $0`;pwd)/base.sh

[ ! -d ~/bin ] && mkdir ~/bin

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

chmod a+x ~/bin/repo
