#!/usr/bin/bash

notify-send '(wal)lpaper is about to change! Pick one!' -t 2000

dir="/home/booperlv/.local/share/pictures/"
basename=`bash ~/.config/rofi/scripts/outputwalls.sh | rofi -dmenu -theme ~/.cache/wal/rofinobar.rasi`
file=$dir$basename

echo $file

rm -rf ~/.cache/swaywal
ln -s $file ~/.cache/swaywal
wal -n -i $file

python ~/.config/foot/scripts/pywal.py

killall -q waybar
waybar &

killall -q mako
mako &

# will take long
bash ~/.cache/wal/walchangepics.sh
