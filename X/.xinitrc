#!/bin/sh

userresources=$HOME/.Xresources

# merge in defaults and keymaps

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap de &
picom -f --experimental-backend &
feh --bg-scale /home/jonathan/.config/wallpaper/wallpaper.jpg &
redshift -c ~/.config/redshift/redshift &
xset s off &
xset -dpms &

exec sowm
