#!/bin/bash


HOME="/home/jonathan"

colors=($(< "$HOME/.cache/wal/colors"))

# colors for suckless programs
echo -n "" > /home/jonathan/.config/colors/colors
for col in "${colors[@]}"; do
  echo "$col" >> /home/jonathan/.config/colors/colors
done

# color variables for scripts
i=0
for col in "${colors[@]}"; do
  sed -i "s/color$i=.*/color$i=\"$col\"/" "$HOME/.dotfiles/scripts/dwmblocks_echo"
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

HOME="/root"

