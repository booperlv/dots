#! /usr/bin/bash
 
# Basic info
HOSTNAME=`uname -n`
ROOT=`df -Ph | grep xvda1 | awk '{print $4}' | tr -d '\n'`
OS='Arch Linux'
KERNEL=`uname -r`
 
# System load
MEMORY1=`free -t -m | grep Total | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`

echo $''
echo $'                                         =============================================        '
echo $'           ,                 ,           - OS....................:' $OS
echo $'           |`.   AxoHelp   .`|           - Kernel................:' $KERNEL
echo $'       |,_  \ |           | /   _,|      - Hostname..............:' $HOSTNAME
echo $'  _    | .\_/ _\_-"""""-_/_ \_/. |    _  =============================================        '
echo $'  \)_   \___/``           ``\___/   _(/  - Memory used...........:' +  "$MEMORY1 / $MEMORY2"
echo $'   \ \..-__/                 \__-../ /   - Swap in use...........:' + " `free -m | tail -n 1 | awk '{print 3}'` MB"
echo $'    \,   _/                   \_   ,/    - Reasons to Exist......: Turning this distro into eye candy'
echo $'      `"-|   .==\       /==.   |-"`      =============================================        '
echo $'          \                   /                                                               '
echo $'           "",,__       __,,""     ,       Hippity Hoppity, This is still ERLV Property!      '
echo $'             ,,/ ``````` \,,    ,-`/       Goodluck surviving on the same 2gb of ram today :) '
echo $'           /` |           | `\  \  \       Use XFCE Session for a traditional experience!     '
echo $'          <_ /|           |\ _> |  |                                                          '
echo $'======================================================================================        '
echo $''
