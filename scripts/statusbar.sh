#!/bin/bash

#xsetroot -name "|  $(amixer get Master | tail -n 1 | cut -d ' ' -f7 | sed -e 's/^.//' -e 's/.$//') |  $(date -u +"%a %e. %b %H:%M")"


audio(){
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

    echo "| ${sink_icon} ${volume}"
    
}

my_date(){
    out=""
    icon=""
    if [[ "$HOSTNAME" == "core" ]]; then
        out=`date | cut -d':' -f1-2`
    elif [[ "$HOSTNAME" == "pc" ]]; then
        out=`date -u +"%a %e. %b %H:%M"`
    fi
    
    echo "| ${icon} ${out}"
}

my_battery(){
    if [[ "$HOSTNAME" == "pc" ]]; then
        return
    fi

   icon=""
   battery_life=`acpi -b | cut -d',' -f2`
   
   echo "${icon}${battery_life}"
}


xsetroot -name "$(my_battery) $(audio) $(my_date)"
