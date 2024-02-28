#!/bin/bash

version=0.0.1
year=$(date +%Y)

source .install/colors.sh
source .install/library.sh
clear

echo -e "${GREEN}"
cat << "EOF"
 ____   __  ____  ____  __  __    ____  ____ 
(    \ /  \(_  _)(  __)(  )(  )  (  __)/ ___)
 ) D ((  O ) )(   ) _)  )( / (_/\ ) _) \___ \
(____/ \__/ (__) (__)  (__)\____/(____)(____/

EOF
echo -e "${NONE}"

echo "Version: $version"
echo "Antonio Sarro $year"
echo ""

if _askForConfirmation; then
  source .install/yay.sh
  # source .install/hyprland.sh
  source .install/packages/general-packages.sh
  source .install/install-packages.sh

  echo -e "${GREEN}"
cat << "EOF"
 ____   __  ____  ____  __  __    ____  ____ 
(    \ /  \(_  _)(  __)(  )(  )  (  __)/ ___)
 ) D ((  O ) )(   ) _)  )( / (_/\ ) _) \___ \
(____/ \__/ (__) (__)  (__)\____/(____)(____/

EOF
  echo -e "${NONE}"
  source .install/packages/hyprland-packages.sh
  source .install/install-packages.sh
  source .install/screenlocking.sh

else
  exit 1
fi


