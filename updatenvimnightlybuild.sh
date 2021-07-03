#!/bin/bash

# I made this for arch and don't really have much error handling or the likes here,
# So you probably shouldn't use this. 0.5.0 is close to being pushed to stable anyway B)

# SO 0.5.0 is finally pushed to stable!! I'll be keeping the script here, in case 
# I find a reason to use 0.6 nightly soon, and it'll be handy to have a reference again :D

function install {
    neovimpath=$(whereis nvim | grep -o '/[^ ]*')
#You probably shouldn't use this it's pretty unsecure LOL
    printf 'Downloading Appimage...'
    wget -q https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -P ~/.cache
    printf ' Downloaded Appimage!'

    echo
    printf 'Removing Old Versions...'
    pacmancommand=$(sudo pacman -Rns $(pacman -Qsq neovim) --noconfirm &>/dev/null || :)
    if [ "$pacmancommand" ]; then
        printf 'Deleting pacman neovim package'
    else
        printf 'No neovim package found in pacman...'
    fi
    #cleanup some appimages
    whereis nvim | grep -o '/[^ ]*' | while read -r line; do
        sudo rm -rf $line
    done

    printf 'Removed Old Versions!'

    echo
    printf 'Placing Appimage in Correct Directory...'
    sudo mv ~/.cache/nvim.appimage /usr/local/bin/nvim
    printf ' Placed Appimage in Correct Directory!'

    echo
    printf 'Adding Permissions to New Binaries...'
    sudo chmod 775 /usr/local/bin/nvim
    printf ' Permissions Added to New Binaries!'

    echo
    echo
    echo "Installed Neovim in $neovimpath"
}

function confirminstall {
    printf "$1" ; printf '[Y/n'] ; read -n 1 -r response
    if [[ $response =~ ^[Yy]$ ]]; then
        echo
        echo
        echo "Installing..."
        echo
        install 
    else
        echo
        echo
        echo 'Not going to install then :D'
    fi
}

currentrelease=$(wget https://api.github.com/repos/neovim/neovim/releases -q -O - | jq -r '.[] | .name' | grep 'NVIM v0.5.0')
echo "Current Release is $currentrelease"
currentversion=$(nvim -v | grep 'NVIM v' || : )
echo "Current Version is $currentversion"

if [ "$currentversion" ]; then
    if [[ "${currentrelease}" == "${currentversion}" ]]; then
        local='Latest Release already installed! Would you still like to Install?'
        confirminstall "$local"
    else
        local='You need to update! Install?' 
        confirminstall "$local"
    fi
else
    local="We didn't find any nvim binaries in your path. Would you like to install?"
    confirminstall "$local"
fi
