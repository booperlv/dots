#!/usr/bin/bash

arr=(~/.local/share/pictures/*)

globalfile=(~/.config/sway/scripts/changewalcounter.txt)
globalcounter=$(cat ${globalfile})

if [ "${globalcounter}" -lt "${#arr[@]}" ]; then
    globalcounter=$((globalcounter+1))
else
    globalcounter=0
fi
echo $globalcounter
echo $globalcounter > $globalfile 

updatedglobalcounter=$(cat ${globalfile})
file=${arr[$updatedglobalcounter]}

echo $file
rm -rf ~/.cache/swaywal
ln -s $file ~/.cache/swaywal
wal -n -i $file
python ~/.config/foot/scripts/pywal.py
bash ~/.config/sway/scripts/walchangepics.sh
killall -q waybar
waybar &
