#!/bin/bash

# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
clear

echo -e "${GREEN}"
cat << "EOF"
 _  _  __   _  _ 
( \/ )/ _\ ( \/ )
 )  //    \ )  / 
(__/ \_/\_/(__/  
EOF

echo -e "${NONE}"

if sudo pacman -Qs yay > /dev/null; then
  echo "yay is already installed"
else
  echo "yay is not installed"
  script_path=$(realpath "$0")
  path=$(dirname "$script_path")
  git clone https://aur.archlinux.org/yay.git ~/yay
  cd ~/yay || exit
  makepkg -si
  cd "$path" || exit
  echo "yay has been installed successfully"
fi

echo ""
