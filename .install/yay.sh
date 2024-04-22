echo -e "${GREEN}"
figlet "yay"
echo -e "${RESET}"

if sudo pacman -Qs yay > /dev/null; then
    echo ":: yay is already installed."
else
    echo ":: Installing yay..."
    install_packages_pacman "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay || exit
    makepkg -si
    cd "$temp_path" || exit
    rm -rf ~/yay
    echo ":: yay has been installed successfully."
fi
echo