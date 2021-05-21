#!/bin/bash

set -o xtrace
path=$(echo /home/jonathan/.mozilla/firefox/*.default-release/bookmarkbackups/)
file=$(ls $path -1rt | tail -1)
bookmarks=$(node /home/jonathan/Documents/node-test/index.js 0 "$path$file")

#echo "$bookmarks"

link=$(echo "$bookmarks" | cut -f1 | dmenu -l 10 -i)
#echo "$link"
if [[ -z "${link}" ]]; then
    exit 1
fi
url=$(echo "$bookmarks" | grep -F "$link" | cut -f2)
#echo "$bookmarks"
#echo "$url"
xdotool key super+9
firefox -newtab -url "$url"
