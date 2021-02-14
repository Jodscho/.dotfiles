#!/bin/bash
sink=`pacmd list-sinks | grep -A 1 '*' | sed -n 2p | cut -d "<" -f2 | cut -d ">" -f1`
speaker="alsa_output.usb-Logitech_Logitech_Speaker-00.analog-stereo"
headphones="alsa_output.pci-0000_00_1b.0.analog-stereo"

# get proper icon
sink_icon=""
if [[ "$sink" == "$speaker" ]]; then
   sink_icon=""
elif [[ "$sink" == "$headphones" ]]; then
   sink_icon=""
fi

# volume level
volume=`amixer get Master | tail -n 1 | cut -d ' ' -f7 | sed -e 's/^.//' -e 's/.$//'`

echo "${sink_icon} ${volume}"
 
