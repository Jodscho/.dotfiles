#!/bin/bash
if [[ "$BUTTON" == 2 ]]; then
    notify-send "$(sudo pacman -Sup | sed 's@.*/@@' | grep -v haskell | cut -d. -f1)"
fi
packs=`pacman -Sup | wc -l`
icon=""
source /home/jonathan/scripts/colors.sh
echo "^c${color4}^${icon} ^d^${packs}"
#echo "${icon} ${packs}"

