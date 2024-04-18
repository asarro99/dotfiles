echo -e "${GREEN}"
figlet "paru"
echo -e "${RESET}"

if sudo pacman -Qs paru > /dev/null; then
    echo ":: paru is already installed."
else
    echo ":: Installing paru..."
    install_packages_pacman "base-devel rustup"
    rustup default stable
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    git clone https://aur.archlinux.org/paru.git ~/paru
    cd ~/paru || exit
    makepkg -si
    cd "$temp_path" || exit
    rm -rf ~/paru
    echo ":: paru has been installed successfully."

    # Change settings to SkipReview when using paru
    sudo sed -i '/^\[options\]/a SkipReview' /etc/paru.conf
fi
echo