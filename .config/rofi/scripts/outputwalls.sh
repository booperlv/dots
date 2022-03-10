#!/usr/bin/bash

search_dir=(~/.local/share/wallpapers/*)

for i in ${!search_dir[@]}
do
    newfilename=$(basename -- "${search_dir[$i]}")
    newicon="${search_dir[i]}"
    echo -en ${newfilename}'\0icon\x1f'${newicon}'\n'
    # echo -en ${newfilename}'\n'
done
