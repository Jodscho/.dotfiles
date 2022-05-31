#!/bin/bash

var="$(echo -e "shutdowm\nreboot\nlogout" | dmenu -p do:)"

if [[ $var == "shutdowm" ]]; then   
    shutdown -h now
fi

if [[ $var == "reboot" ]]; then
    reboot
fi

if [[ $var == "logout" ]]; then
    killall xinit
fi

