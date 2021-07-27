#!/bin/bash
icon=""
out=`date | cut -d':' -f1-2`

echo -n "$(dwmblocks_echo "$icon" "$out") "
