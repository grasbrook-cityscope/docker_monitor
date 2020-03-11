#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "please supply a webhook url as argument!"
    exit
fi

webhook=$1

exited_containers=$(docker ps -a | grep Exited | sed "s/^.*Exited/Exited/")

if [ "$(cat lastmsg)" = "$exited_containers" ];
then
    exit
else
    rm lastmsg
    touch lastmsg
    echo $exited_containers >> lastmsg

    if [ -n "$exited_containers" ]; 
    then 
        echo "found new exited container(s)!"
        python3 send_to_mattermost.py $webhook $exited_containers
    fi
fi
