#!/bin/bash

icon=""
lines=`lsblk --output MOUNTPOINT | grep /media | wc -l`
if [[ $lines == 0 ]]; then
    echo -n ""
else
    echo -n "^c${color4}^${icon} ^d^${lines}"
fi
