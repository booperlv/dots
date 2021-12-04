#!/usr/bin/bash

if [ ! -f ~/.cache/swaywal ]
then
  randomwallpaper=$(shuf -n1 -e ~/.local/share/pictures/*)
  cp -r $randomwallpaper ~/.cache/swaywal
  wal -n -i $randomwallpaper

  killall -q waybar
  killall -q mako
  mako &

  # will take long
  bash ~/.cache/wal/walchangepics.sh &
fi
