#!/bin/bash

source /home/jonathan/Documents/scripts/colors.sh

icon=""
degree=`curl -sf wttr.in/Hildesheim?format=%t`
echo -n "$(echo_color $icon $degree)"
