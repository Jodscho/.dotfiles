#!/bin/bash
icon=""
out=`date | cut -d':' -f1-2`
source /home/jonathan/scripts/colors.sh
echo -n "$(echo_color "$icon" "$out")"
