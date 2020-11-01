#!/bin/bash
filename=`ls ~/Documents/cheatsheets/ | sed 's/\.[^.]*$//' | dmenu -i -l 5`

if [[ -n "$filename" ]]; then
    zathura "~/Documents/cheatsheets/${filename}.pdf"
fi

