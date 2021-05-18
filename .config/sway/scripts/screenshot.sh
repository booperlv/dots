#!/usr/bin/bash

echo $1

takescreenshot() {
    filename="$(rofi -p 'file name' -dmenu -theme /home/booperlv/.cache/wal/rofiterminal.rasi || true)"
    echo $filename
    if [ "$filename" ]; then
       grimshot --notify save $1 /home/booperlv/Pictures/$filename
    else
        grimshot --notify save $1
    fi
}
if [ -z "$1" ]; then
    echo "No argument!"
elif [ $1 = "active" ]; then
    takescreenshot active
elif [ $1 = "window" ]; then
    takescreenshot window
elif [ $1 = "screen" ]; then
    takescreenshot screen
elif [ $1 = "output" ]; then
    takescreenshot output
elif [ $1 = "area" ]; then
    takescreenshot area
fi
