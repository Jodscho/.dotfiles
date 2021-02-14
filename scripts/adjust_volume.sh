#!/bin/bash

if [[ "$1" == 1 ]]; then
    amixer set Master 10%+
elif [[ "$1" == 0 ]]; then
    amixer set Master 10%-
fi

