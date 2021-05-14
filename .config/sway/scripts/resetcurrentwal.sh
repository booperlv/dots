#!/usr/bin/bash

notify-send 'resetting the current wal!' -t 2000

# create an array with all the filer/dir inside ~/myDir
arr=(~/.local/share/pictures/*)

globalcounter=$(cat ~/.config/sway/scripts/changewalcounter.txt)
file=${arr[$globalcounter]}

wal -n -i $file 

python ~/.config/foot/scripts/pywal.py

killall -q waybar
waybar &

killall -q mako
mako &

# will take long
bash ~/.cache/wal/walchangepics.sh
