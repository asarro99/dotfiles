# ---------------------------------------------------------------------
# Check if required packages for the installation script are installed
# ---------------------------------------------------------------------

# Synchronize pacman database
sudo pacman -Sy
echo

echo -e "${BLUE}Checking if required packages are installed...${RESET}"
install_packages_pacman "gum" "figlet"
