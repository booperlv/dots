#!/usr/bin/bash
BASEASSET=~/.local/share/themes/base-assets
if [ -f "$BASEASSET" ]; then
else
  cp -r ~/.local/share/themes/walgtk/gtk-3.0/assets ~/.local/share/themes/walgtk/base-assets
end

rm -rf ~/.local/share/themes/walgtk/gtk-3.0/assets
cp -r ~/.local/share/themes/walgtk/base-assets ~/.local/share/themes/walgtk/gtk-3.0/assets
mogrify -path ~/.local/share/themes/walgtk/gtk-3.0/assets -format png -fuzz 30% -fill "{color3}" -opaque "#ffd86e" -fuzz XX% ~/.local/share/themes/walgtk/gtk-3.0/assets/*.png
