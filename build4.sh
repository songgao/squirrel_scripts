#!/bin/bash

source inc4

DIR=$(cd $(dirname $0) && pwd)
export VANILLA='test-vanilla'
export VANILLA_INIT=$DIR/init.sh

lxc_scripts/create.sh && lxc_scripts/clone.sh
