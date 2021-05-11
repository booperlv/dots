#!bin/bash

setxkbmap -option caps:super -layout us -variant colemak
xmodmap -e "clear Lock"
