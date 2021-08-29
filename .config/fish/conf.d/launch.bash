bold=$(tput bold)
normal=$(tput sgr0)

blackbg=$(tput setab 0)
redbg=$(tput setab 1)

greenfg=$(tput setaf 2)
whitefg=$(tput setaf 7)

if [ "$(tty)" = "/dev/tty1" ]; then

  # Print the available desktop environments

  printf "$bold$redbg\nWayland$normal$blackbg\n"
  
  wayland_sessions=$(ls /usr/share/wayland-sessions)
  wl_execs=()
  wl_indexes=()
  counter=0
  for file in $wayland_sessions; do
    f=$(printf "${file##*/}");
    filename=$(grep '^Name=' /usr/share/wayland-sessions/$file |
      tail -1 | sed 's/^Name=//')
    printf "$filename $greenfg$bold($counter)$normal$whitefg\n"
    
    execute=$(grep '^Exec=' /usr/share/wayland-sessions/$file | tail -1 | sed 's/^Exec=//' | sed 's/%.//' | sed 's/^"//g' | sed 's/" *$//g')
    wl_execs+=("$execute")
    wl_indexes+=("$counter")
  
    counter="$((counter+1))"
  done
  
  printf "$bold$redbg\nX11$normal$blackbg"

  xsessions=$(ls /usr/share/xsessions)
  x_execs=()
  x_indexes=()
  for file in $xsessions; do
    f=$(printf "${file##*/}");
    filename=$(grep '^Name=' /usr/share/xsessions/$file |
      tail -1 | sed 's/^Name=//')
    printf "\n$filename $greenfg$bold($counter)$normal$whitefg"
    
    execute=$(grep '^Exec=' /usr/share/xsessions/$file | tail -1 | sed 's/^Exec=//' | sed 's/%.//' | sed 's/^"//g' | sed 's/" *$//g')
    x_execs+=("$execute")
    x_indexes+=("$counter")
    
    counter="$((counter+1))"
  done
  
  printf "\n\n"

  # Get input and execute

  read -p ""$bold$redbg"Which Desktop?$normal$blackbg " desktop

  if [ "$desktop" = "" ] || [ "$desktop" = "\n" ]; then
    printf "Exiting\n"
    exit
  else
    # for wayland, just execute the binary
    len_wl_sessions=${#wl_execs[@]}
    for ((i=0; i < $len_wl_sessions; i++)); do
      item=${wl_execs["$i"]}
      index=${wl_indexes["$i"]}
      if [ "$desktop" == "$item" ] || [ "$desktop" == "$index" ]; then
        $item &> /dev/null && kill -9 $PPID
      fi
    done
    
    # for x, startx then destkop environment
    len_xsessions=${#x_execs[@]}
    for ((i=0; i < $len_xsessions; i++)); do
      item=${x_execs[$i]}
      index=${x_indexes[$i]}
      if [ "$desktop" == "$item" ] || [ "$desktop" == "$index" ]; then
        path=$(type -p $item)
        startx "$path" &> /dev/null && kill -9 $PPID
      fi
    done
  fi
fi
