#!/bin/bash

DIR=$(cd $(dirname $0) && pwd)

export NUM_START=1
export NUM_END=49
export NAME_PREFIX='squirrel-'
export VANILLA='squirrel-vanilla'
export VANILLA_INIT=$DIR/init.sh

echo $VANILLA_INIT

cd lxc_scripts
./create.sh
