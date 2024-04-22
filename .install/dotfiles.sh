echo -e "${GREEN}"
figlet "Symlink"
echo -e "${NONE}"

SCRIPT=$(realpath "$0")
path=$(dirname "$SCRIPT")

if [ -d $path/configs/.config/dunst ]; then
    install_symlink ~/.config/dunst $path/configs/.config/dunst ~/.config
fi

if [ -d $path/configs/.config/hypr ]; then
    install_symlink ~/.config/hypr $path/configs/.config/hypr ~/.config
fi

if [ -d $path/configs/.config/kitty ]; then
    install_symlink ~/.config/kitty $path/configs/.config/kitty ~/.config
fi

if [ -d $path/configs/.config/neofetch ]; then
    install_symlink ~/.config/neofetch $path/configs/.config/neofetch ~/.config
fi

if [ -d $path/configs/.config/rofi ]; then
    install_symlink ~/.config/rofi $path/configs/.config/rofi ~/.config
fi

if [ -d $path/configs/.config/waybar ]; then
    install_symlink ~/.config/waybar $path/configs/.config/waybar ~/.config
fi

if [ -d $path/configs/.config/fontconfig ]; then
    install_symlink ~/.config/fontconfig $path/configs/.config/fontconfig ~/.config
fi

if [ -e $path/configs/.config/starship.toml ]; then
    install_symlink ~/.config/starship.toml $path/configs/.config/starship.toml ~/.config
fi

if [ -e $path/configs/.gitconfig ]; then
    install_symlink ~/.gitconfig $path/configs/.gitconfig ~/
fi

echo ":: Symbolic links created."
echo