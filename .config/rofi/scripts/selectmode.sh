#!/usr/bin/bash

DRUN="rofi -show drun -theme ~/.cache/wal/rofiinputbar.rasi"
RUN="rofi -show run -theme ~/.cache/wal/rofiinputbar.rasi"
WINDOW="rofi -show window -theme ~/.cache/wal/rofiinputbar.rasi"
TERM="rofi -show term -theme ~/.cache/wal/rofiterminal.rasi"
POWER="rofi -show power -theme ~/.cache/wal/rofipowermenu.rasi"

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
