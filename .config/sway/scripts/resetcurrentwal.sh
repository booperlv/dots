#!/usr/bin/bash

notify-send 'resetting the current wal!' -t 2000

file=(~/.cache/swaywal)

wal -n -i $file 

python ~/.config/foot/scripts/pywal.py

killall -q waybar
waybar &

killall -q mako
mako &

# will take long
bash ~/.cache/wal/walchangepics.sh
