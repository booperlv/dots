#!/usr/bin/bash

wal -i ~/.local/share/pictures
qtile cmd-obj -o cmd -f restart
bash ~/.config/qtile/scripts/walchangepics.sh
