#!/bin/bash
if [[ "$BUTTON" == 2 ]]; then
    notify-send "$(sudo pacman -Sup | sed 's@.*/@@' | grep -v haskell | cut -d. -f1)"
fi
packs=`pacman -Sup | wc -l`
icon=""
echo "${icon} ${packs}"

