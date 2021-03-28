#!/bin/bash

source /home/jonathan/scripts/colors.sh
if [[ -n "$BUTTON" ]]; then
    notify-send "clicked $BUTTON" 
fi

icon=""
degree=`curl -sf wttr.in/Hildesheim?format=%t`
#echo "${icon} ${degree}"
echo "^c${color4}^${icon} ^d^${degree}"
