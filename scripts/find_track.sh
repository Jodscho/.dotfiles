#!/bin/bash
cd "$HOME/Music"
track=$(find . -type f | dmenu -i -l 10)

if [[ -z "$track" ]]; then
	exit
fi

if ! pgrep cmus > /dev/null ; then
	st -e cmus &
fi

sleep 0.1

cmus-remote -f "$track"
