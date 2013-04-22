#!/bin/bash

trap 'echo interrupted; exit' INT

source inc

for i in $(seq -w $NUM_START $NUM_END)
do
    IP=10.0.3.1$i
    ssh root@$IP 'sh -c "nohup squirrel -c 10.0.3.1:1234 -i $(number) > /dev/null 2> /dev/null < /dev/null &"'
    sleep 1
    ssh root@$IP olsrd
done
