#!/usr/bin/bash

notify-send 'converting to light theme' -t 2000 

file=(~/.cache/swaywal)

wal -n -l -i $file

python ~/.config/foot/scripts/pywal.py

killall -q waybar
waybar &

killall -q mako
mako &

# will take long
bash ~/.cache/wal/walchangepics.sh
