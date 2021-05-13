#!/usr/bin/bash

stateofwaybar="$(pgrep waybar)"

if [[ -z $stateofwaybar ]]; then
    swaymsg exec waybar
else
    killall -q waybar
fi
