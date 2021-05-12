#!/usr/bin/bash
picom &
python3 ~/.config/qtile/colors.py
wal -i ~/.local/share/pictures/
bash ~/.local/share/scripts/xcolemak.sh
#qtile cmd-obj -o cmd -f hide_show_bar -a bottom
