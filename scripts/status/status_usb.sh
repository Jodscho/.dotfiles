#!/bin/bash

source /home/jonathan/Documents/scripts/colors.sh
icon=""
lines=`lsblk --output MOUNTPOINT | grep /media | wc -l`
if [[ $lines == 0 ]]; then
    echo -n ""
else
    echo -n "$(echo_color $icon $lines)"
fi
