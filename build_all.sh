#!/bin/bash

source inc

DIR=$(cd $(dirname $0) && pwd)
export VANILLA='test-vanilla'
export VANILLA_INIT=$DIR/init.sh

cd files
python -m SimpleHTTPServer 8099 &
SERVER_PID=$!
cd $DIR

lxc_scripts/create.sh #&& lxc_scripts/clone.sh
echo $SERVER_PID
kill $SERVER_PID
