#!/bin/bash

gitinstallprog() {
	path="/home/jonathan/.local/src/$(basename "$1" .git)"
	git clone $1 $path && cd $path
	make
	sudo make install
}

# install packages from arch repo
sudo pacman -S --needed - < /home/jonathan/.dotfiles/pkglist.txt

# other programs
gitinstallprog "git@github.com:Jodscho/st-build.git"
gitinstallprog "git@github.com:Jodscho/dmenu-build.git"
gitinstallprog "git@github.com:Jodscho/tabbed-build.git"
gitinstallprog "https://github.com/JLErvin/berry.git"
gitinstallprog "https://github.com/muennich/sxiv.git"

# configurations
# start dunst service
# path to scripts folder, maybe not even necessary






