if [ "$(tty)" = "/dev/tty2" ]; then
  printf """
  Can be blank to proceed to TTY
  sway(0)
  budgie(1)
  
  """

  read -p "Which Desktop? " desktop
  if [ "$desktop" = "0" ] || [ "$desktop" = "sway" ]; then
    sway &> /dev/null && kill -9 $PPID
  elif [ "$desktop" = "1" ] || [ "$desktop" = "budgie" ]; then
    startx &> /dev/null && kill -9 $PPID
  elif [ "$desktop" = "" ] || [ "$desktop" = "\n" ]; then
    exit
  fi
fi
