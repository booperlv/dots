#Yeah, don't use it tbh

rm -rf .config/*

cp -r ~/.config/alacritty ~/.config/fish ~/.config/foot ~/.config/mako ~/.config/nvim ~/.config/rofi ~/.config/sway ~/.config/wal ~/.config/waybar .config/

rm -rf .local/share/wallpapers

cp -r ~/.local/share/wallpapers .local/share/wallpapers

rm -rf .local/share/scripts

cp -r ~/.local/share/scripts .local/share/scripts

git add -A .
datetime=$(date)
git commit -m "$datetime"

git push
