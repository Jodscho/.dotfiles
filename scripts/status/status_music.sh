#!/bin/bash

if [[ $(pgrep cmus) ]]; then
	
	artist=$(cmus-remote -Q | grep -a '^tag artist' | awk '{gsub("tag artist ", "");print}')
	track=$(cmus-remote -Q | grep -a '^tag title' | awk '{gsub("tag title ", "");print}')
	position=$(cmus-remote -Q | grep -a '^position' | awk '{gsub("position ", "");print}')
	duration=$(cmus-remote -Q | grep -a '^duration' | awk '{gsub("duration ", "");print}')
	stat=$(cmus-remote -Q | grep -a '^status' | awk '{gsub("status ", "");print}')
	file=`cmus-remote -Q | grep file | awk '{gsub("file ", "");print}'`

	if [[ -z "$file" ]]; then
		echo ""
		return
	fi
	
	if [[ $stat == 'playing' ]]; then
		stat=''
	else
		stat=''
	fi

	tmp=""
	tmp2=""

	if [ -z "$artist" ] || [ -z "$track" ]; then
		base=$(basename "$file")
		printf -v tmp "%s " "$base"
	else
		printf -v tmp "%s - %s " "$artist" "$track"
	fi

	
	printf -v tmp2 "%0d:%02d/%0d:%02d" $((position%3600/60)) $((position%60)) $((duration%3600/60)) $((duration%60))

	tmp="${tmp}${tmp2}"

	source /home/jonathan/scripts/colors.sh
	echo -n "$(echo_color "$stat" "$tmp")"
	#printf "%s" "^c${color14}^"
	#printf "^c${color4}^%s ^d^%s" "$stat" "$tmp"
	#printf "%s %s" "$stat" "$tmp"

else
	echo ""
fi
