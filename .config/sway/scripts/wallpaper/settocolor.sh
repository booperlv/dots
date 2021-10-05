#!/bin/bash

rm -rf ~/.cache/swaywal
convert -size 100x100 xc:$(zenity --color-selection) ~/.cache/swaywal.png
ln -s ~/.cache/swaywal.png ~/.cache/swaywal

swaymsg reload
