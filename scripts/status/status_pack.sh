
#!/bin/bash
if [[ -n "$BUTTON" ]]; then
    notify-send "clicked with $BUTTON" 
fi

packs=`pacman -Sup | wc -l`
icon=""

echo "${icon} ${packs}"
