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
feh --bg-scale /home/jonathan/.dotfiles/feh/wallpaper.jpg &
redshift -c ~/.config/redshift/redshift &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
dwmblocks &
xset s off &
xset -dpms &

exec ./Documents/scripts/startdwm.sh
