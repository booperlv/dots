#!/usr/bin/bash

# create an array with all the filer/dir inside ~/myDir
arr=(~/.local/share/pictures/*)

globalcounter=$(cat ~/.config/sway/scripts/changewalcounter.txt)
file=${arr[$globalcounter]}

echo $file
wal -n -i $file 
python ~/.config/foot/scripts/pywal.py

bash ~/.config/sway/scripts/walchangepics.sh
killall -q waybar
waybar &
