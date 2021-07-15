#!/bin/bash
icon=""
out=`date | cut -d':' -f1-2`
source /home/jonathan/Documents/scripts/colors.sh
echo -n "$(echo_color "$icon" "$out")"
