#!/bin/bash

out=$(nmcli -t -f STATE general)
icon=""

source /home/jonathan/Documents/scripts/colors.sh

if [[ "$out" == "connected" ]]; then
	echo -n "$(echo_color "$icon" "on")"
else
	echo -n "$(echo_color "$icon" "off")"
fi
