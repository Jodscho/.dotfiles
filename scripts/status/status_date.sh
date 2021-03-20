#!/bin/bash
out=""
icon=""
if [[ "$HOSTNAME" == "core" ]]; then
    out=`date | cut -d':' -f1-2`
elif [[ "$HOSTNAME" == "pc" ]]; then
    out=`date -u +"%a %e. %b - %H:%M"`
fi

echo "${icon} ${out}"
