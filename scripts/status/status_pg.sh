#!/bin/bash
packs=`pacman -Sup | wc -l`
icon=""

echo -n "$(dwmblocks_echo $icon $packs)"

