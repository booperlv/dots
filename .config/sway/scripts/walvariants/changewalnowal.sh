#!/usr/bin/bash

notify-send 'wal colors changing!' -t 2000

arr=(~/.local/share/pictures/*)
globalfile=(~/.config/sway/scripts/walvariants/changewalnowalcounter.txt)

globalcounter=$(cat ${globalfile})

arrlength=`expr ${#arr[@]} - 1`

if [ "${globalcounter}" -ge "$arrlength" ]; then
    globalcounter=0
else
    globalcounter=$((globalcounter+1))
fi

echo $globalcounter
echo $globalcounter > $globalfile

updatedglobalcounter=$(cat ${globalfile})
file=${arr[$updatedglobalcounter]}

echo $file
wal -n -i $file

python ~/.config/foot/scripts/pywal.py

killall -q waybar
waybar &

killall -q mako
mako &

bash ~/.cache/wal/walchangepics.sh
