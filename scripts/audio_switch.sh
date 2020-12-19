#!/bin/bash

speaker="alsa_output.usb-Logitech_Logitech_Speaker-00.analog-stereo"
headphones="alsa_output.pci-0000_00_1b.0.analog-stereo"
sink=`pacmd list-sinks | grep -A 1 '*' | sed -n 2p | cut -d "<" -f2 | cut -d ">" -f1`

if [[ "$sink" == "$speaker" ]]; then
    pacmd set-default-sink "$headphones"
elif [[ "$sink" == "$headphones" ]]; then
    pacmd set-default-sink "$speaker"
fi
