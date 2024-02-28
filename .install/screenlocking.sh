#!/bin/bash
echo -e "${GREEN}"
cat << "EOF"
 ____   __  ____  ____  __  __    ____  ____ 
(    \ /  \(_  _)(  __)(  )(  )  (  __)/ ___)
 ) D ((  O ) )(   ) _)  )( / (_/\ ) _) \___ \
(____/ \__/ (__) (__)  (__)\____/(____)(____/

EOF
echo -e "${NONE}"

if [[ $(_isInstalledYay "hypridle-git") == 1 ]] || [[ $(_isInstalledYay "hyprlock-git") == 1 ]]; then
    echo "Installing hyprlock and hypridle..."

    # Install Hypridle and Hyprlock
    yay --noconfirm -S hypridle-git hyprlock-git

    # Remove Swayidle
    if [[ $(_isInstalledPacman "swayidle") == 0 ]]; then
        sudo pacman --noconfirm -Rns swayidle
    fi

    # Remove Swaylock
    if [[ $(_isInstalledYay "swaylock-effects-git") == 0 ]]; then
        yay --noconfirm -Rns swaylock-effects-git
    fi
fi