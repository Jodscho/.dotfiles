#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap de &
picom -f &
feh --bg-scale /home/jonathan/.dotfiles/feh/wallpaper.jpg &
redshift -c ~/redshift &
sxhkd -c ~/sxhkdrc &

while true; do
    xsetroot -name "$(date | cut -d':' -f1-2) |$(acpi -b | cut -d',' -f2)"
    sleep 1m
done &

exec dwm
