#!/bin/bash
mkdir -p ~/vim-sessions
list=$'new-session\n'`ls ~/vim-sessions`
opt=`echo "$list" | dmenu -i -l 10`
echo $opt
