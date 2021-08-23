#!/usr/bin/bash

notify-send '(wal)lpaper changing!' -t 2000

arr=(~/.local/share/pictures/*)
globalfile=(~/.config/sway/scripts/changewalcounter.txt)
globalcounter=$(cat ${globalfile})

arrlength=`expr ${#arr[@]} - 1`

if [ "${globalcounter}" -ge "$arrlength" ]; then
    globalcounter=0
else
    globalcounter=$((globalcounter+1))
fi

echo $globalcounter > $globalfile 

updatedglobalcounter=$(cat ${globalfile})
file=${arr[$updatedglobalcounter]}

echo $file
rm -rf ~/.cache/swaywal
ln -s $file ~/.cache/swaywal
wal -n -i $file

killall -q waybar

killall -q mako
mako &

# will take long
bash ~/.cache/wal/walchangepics.sh &
