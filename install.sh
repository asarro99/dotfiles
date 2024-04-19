#!/bin/bash

version=0.0.1
year=$(date +%Y)

# Load utils
source .install/utils/colors.sh
source .install/utils/library.sh
clear

# Startup Greeting
echo -e "${GREEN}"
cat << "EOF"
 ____   __  ____  ____  __  __    ____  ____ 
(    \ /  \(_  _)(  __)(  )(  )  (  __)/ ___)
 ) D ((  O ) )(   ) _)  )( / (_/\ ) _) \___ \
(____/ \__/ (__) (__)  (__)\____/(____)(____/

EOF
echo "Version: $version"
echo "Antonio Sarro $year"
echo -e "${RESET}"

# Load required
source .install/required.sh

# # Ask for confirmation
if gum confirm "Do you want to continue?"; then
    echo "Ok, let's go!"
else
    echo "Ok, see you next time!"
    exit 0
fi

# Check if paru is installed
source .install/paru.sh

# Upadate system before install all the packages
source .install/updatesys.sh

# Prepare the system for installation
source .install/preparation.sh

# Install general packages
source .install/packages/general.sh

# Install hyprland packages
source .install/packages/hyprland.sh

# Install coding tools
source .install/coding.sh

# Symlink dotfiles
source .install/dotfiles.sh

# Symlink gtk
source .install/gtk.sh

# Symlink zsh
source .install/zsh.sh