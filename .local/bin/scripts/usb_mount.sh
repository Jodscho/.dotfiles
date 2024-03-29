#!/bin/bash

if [[ -z "$1" ]]; then
    exit 1
fi

function notify_sudo_send(){
	sudo -u jonathan DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "$1" -i usb -t 800
}

# pass 0 to mount
if [[ "$1" == 0 ]]; then
    usbs=`lsblk -n -o PATH,SIZE,FSTYPE,TYPE,LABEL | grep -v sda | grep part |  dmenu -p 'mount: '`
    if [[ -z "${usbs}" ]]; then
        exit 1
    fi
    split=($usbs)
    if [[ -z "${split[4]}" ]]; then
        path="/media/USB_NO_LABEL"
    else
        path="/media/${split[4]}"
    fi

    mkdir -p "${path}" && mount "${split[0]}" "${path}" -o umask=000 && notify_sudo_send "mounted"

    #if [[ "${split[2]}" == "ntfs" ]]; then
    #    mkdir -p "${path}" && mount "${split[0]}" "${path}" -o umask=000
    #else
    #    mkdir -p "${path}" && mount "${split[0]}" "${path}" -o umask=000
    #fi

# pass 1 to un-mount
elif [[ "$1" == 1 ]]; then
    usbs=`lsblk -p -n -o MOUNTPOINT,LABEL | grep -v sda | awk '{if($2) print $0;}' | dmenu -p 'unmount'`
    if [[ -z "${usbs}" ]]; then
        exit 1
    fi
    split=($usbs)
    umount "${split[0]}" && rmdir /media/"${split[1]}" && notify_sudo_send "unmounted"
fi

