packagesPacman=(
    "hyprland"
    "hyprpaper"
    "hyprlock"
    "hypridle"
    "hyprcursor"
    "dunst"
    "waybar"
    "swappy"
    "cliphist"
    "xdg-desktop-portal-hyprland"
)

packagesYay=(
    "rofi-lbonn-wayland"
    "grimblast-git"
)

echo "Install only missing hyprland packages..."
install_packages_pacman "${packagesPacman[@]}";
install_packages_yay "${packagesYay[@]}";