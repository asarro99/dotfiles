echo -e "${GREEN}"
figlet "Coding"
echo -e "${NONE}"

echo -e "${BLUE}Checking if coding required packages are installed...${RESET}"
install_packages_pacman "go"
install_packages_paru "nvm"