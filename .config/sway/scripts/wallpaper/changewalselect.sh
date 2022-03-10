#!/usr/bin/bash

notify-send '(wal)lpaper is about to change! Pick one!' -t 2000

dir="/home/booperlv/.local/share/wallpapers/"
basename=`bash ~/.config/rofi/scripts/outputwalls.sh | rofi -dmenu -theme ~/.cache/wal/rofiinputbar.rasi || true`
if [ $basename ]; then
    file=$dir$basename
    echo $file
    
    rm -rf ~/.cache/swaywal
    cp -r $file ~/.cache/swaywal
    wal -n -i $file

    killall -q waybar
    
    killall -q mako
    mako &
    
    # will take long
    bash ~/.cache/wal/walchangepics.sh &
fi
