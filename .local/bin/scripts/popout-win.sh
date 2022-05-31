#!/bin/bash

#active=$(xdotool getactivewindow)
#class=$(xdotool getwindowclassname "$active")
#root_win=$(xwininfo -root | awk '/Window id:/{print $4}')
#
#if [[ "$class" != 'tabbed' ]]; then
#	exit
#fi
#
#for win in $(xdotool getwindowname "$active" | xargs xdotool search --name); do
#	if [[ "$win" != "$active" ]]; then
#		xdotool windowreparent "$win" "$root_win"
#		xdotool windowactive "$win"
#	fi
#done


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


