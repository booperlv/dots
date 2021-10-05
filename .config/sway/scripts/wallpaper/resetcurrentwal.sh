#!/usr/bin/bash

notify-send 'resetting the current wal!' -t 2000

file=(~/.cache/swaywal)

wal -n -i $file 

killall -q waybar

killall -q mako
mako &

# will take long
bash ~/.cache/wal/walchangepics.sh &
