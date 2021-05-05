#!bin/bash

setxkbmap -option caps:backspace -layout us -variant colemak
xmodmap -e "clear Lock"
