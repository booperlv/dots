#!/usr/bin/bash

SHUTDOWN="Shutdown"
SHUTDOWNICON="/usr/share/icons/Papirus/symbolic/actions/system-shutdown-symbolic.svg"
REBOOT="Restart"
REBOOTICON="/usr/share/icons/Papirus/symbolic/actions/system-reboot-symbolic.svg"
LOCK="Lock"
LOCKICON="/usr/share/icons/Papirus/symbolic/actions/system-lock-screen-symbolic.svg"
SUSPEND="Sleep"
SUSPENDICON="/usr/share/icons/Papirus/symbolic/actions/system-suspend-symbolic.svg"
LOGOUT="Logout"
LOGOUTICON="/usr/share/icons/Papirus/symbolic/actions/system-log-out-symbolic.svg"

if [[ "$@" == "$SHUTDOWN" ]]; then
	killall -q rofi
	systemctl poweroff
elif [[ "$@" == "$REBOOT" ]]; then
	killall -q rofi
	systemctl reboot
elif [[ "$@" == "$LOCK" ]]; then
	killall -q rofi
  swaylock -i ~/.cache/swaywal
elif [[ "$@" == "$SUSPEND" ]]; then
	killall -q rofi
	systemctl suspend
elif [[ "$@" == "$LOGOUT" ]]; then
	killall -q rofi
	pkill -U $USER
else
	:
fi

ITEMARRAY=($SHUTDOWN $REBOOT $LOCK $SUSPEND $LOGOUT)
ICONARRAY=($SHUTDOWNICON $REBOOTICON $LOCKICON $SUSPENDICON $LOGOUTICON)
for ((i=0; i < "${#ITEMARRAY}"; i++)); do
	loopitem="${ITEMARRAY[$i]}"
	iconitem="${ICONARRAY[$i]}"
	echo -e "$loopitem\0icon\x1f$iconitem"
done
