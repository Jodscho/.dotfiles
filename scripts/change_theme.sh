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

# dunst
dunst_frame="frame_color = \"${colors[1]}\""
dunst_background="background = \"${colors[0]}\""
dunst_foreground="foreground = \"${colors[15]}\""
sed -i "s/frame_color = .*/${dunst_frame}/g" "$HOME/.config/dunst/dunstrc"
sed -i "s/background = .*/${dunst_background}/g" "$HOME/.config/dunst/dunstrc"
sed -i "s/foreground = .*/${dunst_foreground}/g" "$HOME/.config/dunst/dunstrc"

# zathura
zathura_fg="set default-fg \"${colors[15]}\""
zathura_fg="set default-fg \"${colors[15]}\""
sed -i "s/set default-fg .*/${zathura_fg}/g" "$HOME/.config/zathura/zathurarc"

sed -i "s/set completion-bg .*/set completion-bg \"${colors[0]}\"/g" "$HOME/.config/zathura/zathurarc"
sed -i "s/set completion-bg .*/set completion-fg \"${colors[7]}\"/g" "$HOME/.config/zathura/zathurarc"
sed -i "s/set completion-highlight-bg .*/set completion-highlight-bg \"${colors[2]}\"/g" "$HOME/.config/zathura/zathurarc"
sed -i "s/set completion-highlight-fg .*/set completion-highlight-fg \"${colors[0]}\"/g" "$HOME/.config/zathura/zathurarc"
sed -i "s/set inputbar-bg .*/set inputbar-bg \"${colors[0]}\"/g" "$HOME/.config/zathura/zathurarc"
sed -i "s/set inputbar-fg .*/set inputbar-fg \"${colors[7]}\"/g" "$HOME/.config/zathura/zathurarc"

# tabbed

