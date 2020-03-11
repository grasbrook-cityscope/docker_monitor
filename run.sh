#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "please supply a webhook url as argument!"
    exit
fi

webhook=$1

exited_containers=$(docker ps -a | grep Exited | sed "s/^.*Exited/Exited/")
if [ -n "$exited_containers" ]; 
then 
    echo "found exited container!"
    python3 send_to_mattermost.py $webhook $exited_containers
fi
