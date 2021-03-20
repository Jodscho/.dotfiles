#!/bin/bash

packs=`pacman -Syup | wc -l`
icon=""

echo "${icon} ${packs}"
