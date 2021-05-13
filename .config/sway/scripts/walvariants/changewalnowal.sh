#!/usr/bin/bash

notify-send 'wal colors changing!' -t 2000

# create an array with all the filer/dir inside ~/myDir
arr=(~/.local/share/pictures/*)
globalfile=(~/.config/sway/scripts/walvariants/changewalnowalcounter.txt)

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
wal -n -i $file
python ~/.config/foot/scripts/pywal.py
bash ~/.config/sway/scripts/walchangepics.sh
killall -q waybar
waybar &

killall -q mako
mako &
