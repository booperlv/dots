# dots
Qtile - Picom - Sakura
dotfiles :)

Here's a peek!
![Sweet Tiling, no borders.](https://github.com/booperlv/dots/blob/main/pics/neotermqtile.png?raw=true)

Pywal Generated GTK Theme, practically stolen from Flat Remix Dark
![Pywal Generated GTK Theme](https://github.com/booperlv/dots/blob/main/pics/gtkshowcase.png?raw=true)

Terminal command mode, and the usual Power Menu using sxlock.
![Cool Rofi Modes](https://github.com/booperlv/dots/blob/main/pics/rofiapps.png?raw=true)

As you may see from a little peek into the configs, these dotfiles are NOT made for general use. You will have to edit a number of paths and place these files in their corresponding places. I could've fixed a few things (such as ~ instead of /home/booperlv in python) but let's just say I'm too lazy for it :D.

These are fairly easy to configure though.
I have a cool motd in there too! I use it for my emptty configuration. Couple of versions there.

The Wallpapers I have in local/share/pictures named feh(index) are modified versions from [LAM's](https://www.pixiv.net/en/users/17429) art.

A note about emptywindow.c:
It is literally just an emptywindow that's transparent if you have a compositor. Like a placeholder in a tiling wm.
Compile with "gcc -lX11 emptywindow.c -o emptywindow". You can copy the binary file to /usr/local/bin to execute.
