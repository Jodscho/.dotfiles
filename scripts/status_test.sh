#!/bin/bash
notify-send "test $BUTTON"
if [[ -n $BUTTON ]]; then
    echo "clicked via $BUTTON"
fi
