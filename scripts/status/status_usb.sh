#!/bin/bash

icon=""
lines=`lsblk --output MOUNTPOINT | grep /media | wc -l`
if [[ $lines == 0 ]]; then
    echo ""
else
    echo "${icon} ${lines}"
fi
