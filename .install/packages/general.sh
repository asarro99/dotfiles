packagesPacman=(
    "gum"
    "figlet"
    "btop"
    "kitty"
    "nano"
    "nemo"
    "neofetch"
    "neovim"
    "pavucontrol"
    "partitionmanager"
    "ttf-cascadia-code-nerd"
    "ttf-jetbrains-mono-nerd"
    "papirus-icon-theme"
    "pacman-contrib"
)

packagesYay=(
    "amdgpu_top-bin"
    "bibata-cursor-theme-bin"
)

echo "Install only missing general packages..."
install_packages_pacman "${packagesPacman[@]}";
install_packages_yay "${packagesYay[@]}";
