#!/bin/bash

colors=($(< "$HOME/.cache/wal/colors"))

# xterm
i=0
for col in "${colors[@]}"; do
  sed -i "s/\*.color$i:.*/\*.color$i:$col/" ~/.Xresources
  ((i++))
done

sed -i "s/\*.foreground:.*/\*.foreground:${colors[7]}/" ~/.Xresources
sed -i "s/\*.background:.*/\*.background:${colors[0]}/" ~/.Xresources
sed -i "s/\*.cursorColor:.*/\*.cursorColor:${colors[0]}/" ~/.Xresources

xrdb -load "$HOME/.Xresources"

# dwm & dmenu & st

i=0
for col in "${colors[@]}"; do
  sed -i "s/static const char color$i\[\] = .*/static const char color$i\[\] = \"$col\";/" "$HOME/suckless/dwm-build/config.def.h"
  sed -i "s/static const char color$i\[\] = .*/static const char color$i\[\] = \"$col\";/" "$HOME/suckless/dmenu-build/config.def.h"
  sed -i "s/static const char color$i\[\] = .*/static const char color$i\[\] = \"$col\";/" "$HOME/suckless/st/config.def.h"
  ((i++))
done

cd $HOME/suckless/dwm-build
sudo cp config.def.h config.h && sudo make clean install
cd $HOME/suckless/dmenu-build
sudo cp config.def.h config.h && sudo make clean install

# color variables for scripts
i=0
for col in "${colors[@]}"; do
  sed -i "s/color$i=.*/color$i=\"$col\"/" "$HOME/scripts/colors.sh"
  ((i++))
done


