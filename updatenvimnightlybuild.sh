#!/usr/bin/bash

wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -P ~/.cache
sudo rm -rf /usr/bin/nvim
sudo rm -rf /usr/local/bin/nvim
sudo mv ~/.cache/nvim.appimage /usr/local/bin/nvim
sudo chmod 775 /usr/local/bin/*
