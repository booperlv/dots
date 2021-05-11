#!/usr/bin/bash

ls ~/.local/share/pictures |sort -R |tail -$N |while read file; do
    rm -rf ~/.cache/swaywal
    ln -s ~/.local/share/pictures/$file ~/.cache/swaywal
    wal -i ~/.local/share/pictures/$file
    bash ~/.config/sway/scripts/walchangepics.sh
    break
done
