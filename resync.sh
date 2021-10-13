#Yeah, don't use it tbh

rm -rf .config/*

cp -r ~/.config/alacritty ~/.config/fish ~/.config/foot ~/.config/mako ~/.config/nvim ~/.config/rofi ~/.config/sway ~/.config/wal ~/.config/waybar .config/

rm -rf .local/share/pictures

cp -r ~/.local/share/pictures .local/share/pictures

git add -A .
datetime=$(date)
git commit -m "$datetime"

git push
