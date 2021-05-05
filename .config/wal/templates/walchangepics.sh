#!/usr/bin/bash
rm -rf ~/.local/share/themes/walgtk/gtk-3.0/assets
cp -r ~/.local/share/themes/walgtk/gtk-3.0/actualassets ~/.local/share/themes/walgtk/gtk-3.0/assets
mogrify -path ~/.local/share/themes/walgtk/gtk-3.0/assets -format png -fuzz 30% -fill "{color3}" -opaque "#ffd86e" -fuzz XX% ~/.local/share/themes/walgtk/gtk-3.0/assets/*.png

sudo rm -rf ~/.local/share/themes/walgtk/gtk-2.0/assets
cp -r ~/.local/share/themes/walgtk/gtk-3.0/assets ~/.local/share/themes/walgtk/gtk-2.0/
