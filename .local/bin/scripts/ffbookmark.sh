#!/bin/bash

path=$(echo $HOME/.mozilla/firefox/*.default-release/sessionstore-backups/)
tabs=$(node $HOME/Documents/node-test/index.js t "${path}recovery.jsonlz4")
lastAccessedTab=$(echo "$tabs" | cut -f3 | sort -nr | head -1)
url=$(echo "$tabs" | grep "$lastAccessedTab" | cut -f2)
title=$(echo "$tabs" | grep "$lastAccessedTab" | cut -f1)
dir=$(zenity --file-selection --directory --filename=$HOME/Videos/)

if [ ! -z "$dir" ]; then
	$TERMINAL -e yt-dlp -o "$dir/$title" --embed-thumbnail "$url" 
fi


