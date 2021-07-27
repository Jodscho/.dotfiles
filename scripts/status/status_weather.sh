#!/bin/bash



check_wifi=$(nmcli -t -f STATE general)

if [[ "$check_wifi" == "connected" ]]; then
	icon=""
	degree=`curl -sf wttr.in/Hildesheim?format=%t`
	echo -n "$(dwmblocks_echo $icon $degree)"
else
    echo -n ""
fi

