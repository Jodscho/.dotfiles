#!/bin/bash

if [[ -z "$1" ]]; then
    exit 1
fi

# pass 0 to mount
if [[ "$1" == 0 ]]; then
    usbs=`lsblk -n -o PATH,LABEL,MOUNTPOINT | grep -v sda | awk '{if ($2 && !$3) print $0;}' | dmenu -p 'mount: '`
    if [[ -z "${usbs}" ]]; then
        exit 1
    fi
    split=($usbs)
    path="/media/${split[1]}"
    mkdir -p "${path}" && mount "${split[0]}" "${path}"

# pass 1 to un-mount
elif [[ "$1" == 1 ]]; then
    usbs=`lsblk -p -n -o MOUNTPOINT,LABEL | grep -v sda | awk '{if($2) print $0;}' | dmenu -p 'unmount'`
    if [[ -z "${usbs}" ]]; then
        exit 1
    fi
    split=($usbs)
    umount "${split[0]}" && rmdir /media/"${split[1]}"
fi

