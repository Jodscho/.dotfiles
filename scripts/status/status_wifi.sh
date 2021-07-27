#!/bin/bash

out=$(nmcli -t -f STATE general)
icon=""



if [[ "$out" == "connected" ]]; then
	echo -n "$(dwmblocks_echo "$icon" "on")"
else
	echo -n "$(dwmblocks_echo "$icon" "off")"
fi
