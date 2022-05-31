#!/bin/bash

if [[ "$1" == 1 ]]; then
	amixer set Master 5%+
elif [[ "$1" == 0 ]]; then
    amixer set Master 5%-
fi
volume=`amixer get Master | tail -n 1 | cut -d ' ' -f7 | sed -e 's/^.//' -e 's/.$//'`
dunstify -a "changeVolume" -u low -r "991049" -h int:value:"$volume" "Volume: $volume" -t 800 -i default-vol 
