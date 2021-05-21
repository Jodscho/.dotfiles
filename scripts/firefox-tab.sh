#!/bin/bash
path=$(echo /home/jonathan/.mozilla/firefox/*.default-release/sessionstore-backups/)
tabs=$(node /home/jonathan/Documents/node-test/index.js 1 "${path}recovery.jsonlz4")
lastAccessedTab=$(echo "$tabs" | cut -f3 | sort -nr | head -1)
echo "$tabs" | grep "$lastAccessedTab"

#readarray -t <<<$tabs

#echo "${MAPFILE[3]}"


#entry=$("${MAPFILE[0]}")
#for t in "${MAPFILE[@]}"; do
#	if [ "$entry" -ge $(date +%s) ]; then 
#		entry=
#	    # do something
#	fi
#done



#link=$(echo "$bookmarks" | cut -f1 | dmenu -l 10 -i)
#echo "$link"
#if [[ -z "${link}" ]]; then
#    exit 1
#fi
#url=$(echo "$bookmarks" | grep -F "$link" | cut -f2)
##echo "$bookmarks"
##echo "$url"
#xdotool key super+9
#firefox -newtab -url "$url"
