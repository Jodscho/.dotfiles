#!/bin/bash
packs=`pacman -Sup | wc -l`
icon=""
source /home/jonathan/Documents/scripts/colors.sh
echo -n "$(echo_color $icon $packs)"

