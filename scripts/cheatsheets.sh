#!/bin/bash

cheatsheets="$HOME/.dotfiles/misc/cheatsheets"
filename="$(ls $cheatsheets/*.pdf | xargs basename --suffix=.pdf -a | dmenu -i -l 5)"

if [[ -n "$filename" ]]; then
    zathura "$cheatsheets/${filename}.pdf"
fi

