#!/usr/bin/bash

DRUN="rofi -show drun -theme /home/booperlv/.config/rofi/colors-rofi-dark.rasi"
RUN="rofi -show run -theme /home/booperlv/.config/rofi/colors-rofi-dark.rasi"
WINDOW="rofi -show window -theme /home/booperlv/.config/rofi/colors-rofi-dark.rasi"
TERM="rofi -show term -theme /home/booperlv/.config/rofi/scripts/terminal.rasi"
POWER="rofi -show power -theme /home/booperlv/.config/rofi/scripts/powermenu.rasi"

MODEARRAY='DRUN\nRUN\nWINDOW\nTERM\nPOWER'
ROFIOUTPUT=$(echo -e $MODEARRAY | rofi -dmenu -theme /home/booperlv/.cache/wal/rofipowermenu.rasi)

if [[ "$ROFIOUTPUT" == 'DRUN' ]]; then
	eval $DRUN
elif [[ "$ROFIOUTPUT" == 'RUN' ]]; then
	eval $RUN
elif [[ "$ROFIOUTPUT" == 'WINDOW' ]]; then
	eval $WINDOW
elif [[ "$ROFIOUTPUT" == 'TERM' ]]; then
	eval $TERM
elif [[ "$ROFIOUTPUT" == 'POWER' ]]; then
	eval $POWER
else
	echo "Not taking arguments properly"
fi
