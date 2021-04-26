#! /usr/bin/bash
 
# Basic info
HOSTNAME=`uname -n`
ROOT=`df -Ph | grep xvda1 | awk '{print $4}' | tr -d '\n'`
OS='Arch Linux'
KERNEL=`uname -r`
 
# System load
MEMORY1=`free -t -m | grep Total | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`

# Colors
RED='\033[0:31m'
ORANGE='\033[0:33m'
YELLOW='\033[1:33m'
NOCOLOR='\033[0m'
BLUE='\033[1:34m'
WHITE='\033[1:37m'

echo -e ''
echo -e $BLUE'                                         =============================================        ' $NOCOLOR
echo -e $RED'            ,                 ,           - OS....................:' $OS $NOCOLOR
echo -e $RED'            |`.   AxoHelp   .`|           - Kernel................:' $KERNEL $NOCOLOR
echo -e $RED'       |,_   \ |           | /  _,|       - Hostname..............:' $HOSTNAME $NOCOLOR
echo -e $BLUE'  _    | .\_/ _\_-""""""-_/_\_/. |    _  =============================================        ' $NOCOLOR
echo -e $RED'  \)_   \___/``           ``\___/   _(/  - Memory used...........:' +  "$MEMORY1 / $MEMORY2" $NOCOLOR
echo -e $RED'   \ \..-__/                 \__-../ /   - Swap in use...........:' + " `free -m | tail -n 1 | awk '{print 3}'` MB" $NOCOLOR
echo -e $RED'    \,   _/                   \_   ,/    - Reasons to Exist......: Turning this distro into eye candy' $NOCOLOR
echo -e $BLUE'      `"-|   .==\       /==.   |-"`      =============================================        ' $NOCOLOR
echo -e $RED'          \                   /                                                               ' $NOCOLOR
echo -e $WHITE'           "",,__       __,,""     ,       Hippity Hoppity, This is still ERLV Property       ' $NOCOLOR
echo -e $WHITE'             ,,/ ``````` \,,    ,-`/       Goodluck surviving on the same 2gb of ram today!   ' $NOCOLOR
echo -e $WHITE'           /` |           | `\  \  \       I recommend XFCE Session for ease of use.          ' $NOCOLOR
echo -e $RED'          <_ /|           |\ _> |  |                                                          ' $NOCOLOR
echo -e $RED'======================================================================================        ' $NOCOLOR
echo -e ''
