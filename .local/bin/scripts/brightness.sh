#!/bin/bash
#echo $1 | sudo tee /sys/class/backlight/intel_backlight/brightness

option=$1
val=$2
max=`cat /sys/class/backlight/intel_backlight/max_brightness`
if [[ $option == "i"  ]]; then
    current=`cat /sys/class/backlight/intel_backlight/brightness`
    new_val=$((current + val))
    if [[ $new_val -gt $max ]]; then
        exit 1
    fi
    echo $new_val | sudo tee /sys/class/backlight/intel_backlight/brightness &> /dev/null
fi

if [[ $option = "d" ]]; then
    current=`cat /sys/class/backlight/intel_backlight/brightness`
    new_val=$((current - val))
    echo $new_val | sudo tee /sys/class/backlight/intel_backlight/brightness &> /dev/null
fi
