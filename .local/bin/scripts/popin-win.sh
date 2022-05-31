#!/bin/bash

tabbed_win=$(xdotool search --class tabbed)
pop_in_win=$(xdotool selectwindow)

if [[ -z "$pop_in_win" ]]; then
	exit	
fi

if [[ -z "$tabbed_win" ]]; then
	tabbed_win=$(tabbed -d)
fi

xdotool windowreparent "$pop_in_win" "$tabbed_win"

