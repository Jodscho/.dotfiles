#!/bin/bash

function usage {
        echo "Usage: ./$(basename $0)" 2>&1
        echo '	-s TITLE URL FOLDER saves bookmark'
        echo '	-d GUID deletes bookmark'
        echo '	-c GUID FOLDER change folder'
        echo '	-a add bookmark from current tab'
        echo '	-o open bookmark menu via dmenu'
}


function add_bookmark() {
      echo "$(uuidgen)	$(date +%s)	$1	$2	$3" >> ~/browser-bookmarks
}

# list of arguments expected in the input
optstring=":s::d:h:cao"

while getopts ${optstring} arg; do
  case ${arg} in
    h)
      usage 
      ;;
    s)
	  add_bookmark "$2" "$3" "$4"
      ;;
    o)
	  link=$(awk 'BEGIN{FS="\t"} {printf "%s: %s\n", $5, $3}' ~/browser-bookmarks | dmenu -l 10 -i | cut -d':' -f2) 
	  if [[ -z "${link}" ]]; then
	  	exit 1
	  fi
	  url=$(cat ~/browser-bookmarks | grep -F "${link:1}" | cut -f4)
	  xdotool key super+9
	  firefox -newtab -url "$url"
      ;;
    a)
	  #set -o xtrace
	  link="$(~/scripts/firefox-tab.sh | cut -f1-2)"
	  title="$(echo "$link" | cut -f1 | tr ':' ' ')"
	  title="${title//'&'/'&amp;'}"
	  url="$(echo "$link" | cut -f2)"
	  folderopts=$(cut -f5 ~/browser-bookmarks | uniq | sed '/Sonstiges/d' | sed 's/^/FALSE /' | tr "\n" " ")
	  folder=$(zenity --list --text="Choose folder for bookmark:\n$title" --column="Pick" --column="Folder" $folderopts TRUE Sonstiges FALSE Neu --radiolist)
	  if [[ -n "$folder" ]]; then
	  	if [[ "$folder" == "Neu" ]]; then
			folder=$(zenity --entry --text="Folder name")
		fi
	  		add_bookmark "$title" "$url" "$folder"
	  fi
      ;;
    d)
	  sed -i /$"$2"/d ~/browser-bookmarks
      ;;
    c)
	  newline=$(grep "$2" ~/browser-bookmarks | cut -f1-4 | sed "s/$/,$3/")
	  sed -i /$"$2"/d ~/browser-bookmarks
      echo "$newline" >> ~/browser-bookmarks
      ;;
    \?)
      echo "Invalid Option: -$OPTARG" >&2
      exit 1
      ;;
     :)
      echo "Option -$OPTARG requires and argument." >&2
      exit 1
      ;;
  esac
done
