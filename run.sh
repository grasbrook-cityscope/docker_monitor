#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "please supply a webhook url as argument!"
    exit
fi

webhook=$1

exited_containers=$(docker ps -a | grep Exited)
if [ -n "$exited_containers" ]; 
then 
    echo "found exited container!"
    python $webhook "$exited_containers"
fi
