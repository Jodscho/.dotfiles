#!/bin/bash

speaker="alsa_output.usb-Logitech_Logitech_Speaker-00.analog-stereo"
headphones="alsa_output.pci-0000_00_1b.0.analog-stereo"
sink=`pacmd list-sinks | grep -A 1 '*' | sed -n 2p | cut -d "<" -f2 | cut -d ">" -f1`
icon=""
if [[ "$sink" == "$speaker" ]]; then
	icon="headphones"
    pacmd set-default-sink "$headphones"
elif [[ "$sink" == "$headphones" ]]; then
	icon="volume"
    pacmd set-default-sink "$speaker"
fi
cp "/home/jonathan/.config/dunst/icons/$icon.png" "/home/jonathan/.config/dunst/icons/default-vol.png"

dunstify "output"  -i "$icon" -r "991048" -t 400
