#!/bin/bash

getwindowposition() {

	raw=$(xdotool getwindowgeometry $1)

	xOffset=$(echo "$raw" | grep Position | cut -d' ' -f4 | cut -d',' -f1)
	yOffset=$(echo "$raw" | grep Position | cut -d' ' -f4 | cut -d',' -f2)
	width=$(echo "$raw" | grep Geometry | cut -d' ' -f4 | cut -d'x' -f1)
	height=$(echo "$raw" | grep Geometry | cut -d' ' -f4 | cut -d'x' -f2)

	printf "%sx%s+%s+%s" "$width" "$height" "$xOffset" "$yOffset"
}

activewindow=$(xdotool getactivewindow)
classname=$(xdotool getwindowclassname "$activewindow")

if [[ "$classname" != 'st-256color' && "$classname" != 'tabbed' ]]; then
	exit
fi

alltabbed=$(xdotool search --class tabbed)

for win in $alltabbed; do
	if [[ "$win" == "$activewindow" ]]; then
		tabbedparent="$win"
	fi
done
if [[ -z "$tabbedparent" ]]; then
	geom=$(getwindowposition "$activewindow")
	tabbedparent=$(tabbed -c -d -g "$geom")
	xdotool windowreparent "$activewindow" "$tabbedparent"
fi
if [[ "$classname" == 'st-256color' ]]; then 
	xdotool windowactivate "$tabbedparent"
fi
st -w "$tabbedparent" &	

