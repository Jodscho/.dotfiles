#!/bin/bash
mkdir -p ~/.config/vim-sessions
list=$'new-session\n'`ls ~/.config/vim-sessions`
opt=`echo "$list" | dmenu -i -l 10`
echo $opt
