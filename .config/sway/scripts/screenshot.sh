#!/usr/bin/bash

echo $1

takescreenshot() {
  filename="$(rofi -p 'file name' -dmenu -theme /home/booperlv/.cache/wal/rofiinputbar.rasi || true)"
  echo $filename
  if [ $"$filename" == "exit" ]; then
    return
  else
    if [ "$filename" ]; then
      grimshot --notify save $1 $HOME/Pictures/$filename
    else
      grimshot --notify save $1 
    fi
  fi
}
if [ -z "$1" ]; then
  echo "No argument!"
elif [ $1 = "active" ]; then
  takescreenshot active
elif [ $1 = "window" ]; then
  takescreenshot window
elif [ $1 = "screen" ]; then
  takescreenshot screen
elif [ $1 = "output" ]; then
  takescreenshot output
elif [ $1 = "area" ]; then
  takescreenshot area 
fi
