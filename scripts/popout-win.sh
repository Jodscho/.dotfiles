#!/bin/bash

tabbed_win=$(xdotool search --class tabbed)
root_win=$(xwininfo -root | awk '/Window id:/{print $4}')

if [[ -z "tabbed_win" || -z "root_win" ]]; then
	exit
fi

for win in $(xdotool getwindowname "$tabbed_win" | xargs xdotool search --name); do
	if [[ "$win" != "$tabbed_win" ]]; then
		xdotool windowreparent "$win" "$root_win"
	fi
done


