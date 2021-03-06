bold=$(tput bold)
normal=$(tput sgr0)

blackbg=$(tput setab 0)
redbg=$(tput setab 1)

greenfg=$(tput setaf 2)
whitefg=$(tput setaf 7)

if [ "$(tty)" = "/dev/tty1" ]; then

  clear

  all_execs=()
  all_names=()
  all_indexes=()

  # Print the available desktop environments

  counter=0
  wayland_exists=false
  x11_exists=false

  if [ -d /usr/share/wayland-sessions ]; then
    wayland_sessions=$(ls /usr/share/wayland-sessions)
    wayland_exists=true
    
    printf "$bold$redbg\nWayland$normal$blackbg\n"
    
    for file in $wayland_sessions; do
      f=$(printf "${file##*/}");
      filename=$(grep '^Name=' /usr/share/wayland-sessions/$file |
        tail -1 | sed 's/^Name=//')
      printf "$filename $greenfg$bold($counter)$normal$whitefg\n"
      execute=$(grep '^Exec=' /usr/share/wayland-sessions/$file | tail -1 | sed 's/^Exec=//' | sed 's/%.//' | sed 's/^"//g' | sed 's/" *$//g')

      all_names+=("$filename")
      # all_execs+=("$execute && kill -9 $PPID")
      all_execs+=("$execute &> /dev/null && kill -9 $PPID")
      all_indexes+=("$counter")

      counter="$((counter+1))"
    done
  fi

  if [ -d /usr/share/xsessions ]; then
    xsessions=$(ls /usr/share/xsessions)
    x11_exists=true
    
    printf "$bold$redbg\nX11$normal$blackbg"
    
    for file in $xsessions; do
      f=$(printf "${file##*/}");
      filename=$(grep '^Name=' /usr/share/xsessions/$file |
        tail -1 | sed 's/^Name=//')
      printf "\n$filename $greenfg$bold($counter)$normal$whitefg"
      execute=$(grep '^Exec=' /usr/share/xsessions/$file | tail -1 | sed 's/^Exec=//' | sed 's/%.//' | sed 's/^"//g' | sed 's/" *$//g')
      execute=$(which $execute)

      all_names+=("$filename")
      all_execs+=("($execute || startx $execute) && kill -9 $PPID")
      all_indexes+=("$counter")

      counter="$((counter+1))"
    done
  fi

  if [ "$wayland_exists" == false ] && [ "$x11_exists" == false ]; then
    echo "no desktop environments or window managers detected"
    exit
  fi
  
  printf "\n\n"

  # Get input and execute

  read -p ""$bold$redbg"Which Desktop?$normal$blackbg " desktop

  if [ "$desktop" = "" ] || [ "$desktop" = "\n" ]; then
    eval ${all_execs[0]}
  else
    len_sessions=${#all_indexes[@]}
    for ((i=0; i < $len_sessions; i++)); do
      name=${all_names["$i"]}
      index=${all_indexes["$i"]}
      if [ "$desktop" == "$name" ] || [ "$desktop" == "$index" ]; then
        exec=${all_execs["$i"]}
        eval "$exec"
      fi
    done
  fi

fi
