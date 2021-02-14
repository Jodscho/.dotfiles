#!/bin/bash

if [[ -n "$BUTTON" ]]; then
    notify-send "clicked with $BUTTON"
fi

icon=""
degree=`curl wttr.in/Hildesheim?format=%t`
echo "${icon} ${degree}"
