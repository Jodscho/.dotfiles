#!/bin/bash
packs=`pacman -Sup | wc -l`
icon=""
source /home/jonathan/scripts/colors.sh
echo -n "$(echo_color $icon $packs)"

