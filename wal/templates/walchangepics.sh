#!/usr/bin/bash
rm -rf ~/.themes/FlatRemixWPGTK/gtk-3.0/assets
cp -r ~/.themes/FlatRemixWPGTK/gtk-3.0/actualassets ~/.themes/FlatRemixWPGTK/gtk-3.0/assets
mogrify -path ~/.themes/FlatRemixWPGTK/gtk-3.0/assets -format png -fuzz 30% -fill "{color2}" -opaque "#ffd86e" -fuzz XX% ~/.themes/FlatRemixWPGTK/gtk-3.0/assets/*.png

sudo rm -rf ~/.themes/FlatRemixWPGTK/gtk-2.0/assets
cp -r ~/.themes/FlatRemixWPGTK/gtk-3.0/assets ~/.themes/FlatRemixWPGTK/gtk-2.0/
